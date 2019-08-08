#!/usr/bin/env ruby
require File.expand_path('../../../config/environment', __FILE__)
require 'json'

old = JSON.load(File.open('prod.json'))

questions = {}
categories = {}
question_options = {}
@prefixes = {}
old_options = {}
options = {}
triples = {}

def convert_rdf(rdf)
  prefix, postfix = rdf.split(":")
  if @prefixes.has_key?(prefix)
    prefix = @prefixes[prefix]
  end
  if prefix == '_'
    prefix = '_:'
  end
  "#{prefix}#{postfix}"
end

def find_option(statement, question, q_name)
  if question['q_type'] == 'radio'
    return :"#{q_name}:yes"
  end
  if question['q_type'] == 'text'
    return :"#{q_name}:text"
  end
  if question['q_type'] == 'int'
    return :"#{q_name}:int"
  end
  if question['q_type'] == 'select' || question['q_type'] == 'checkbox'
    return :"#{q_name}:option_#{statement['choice']}"
  end
  return 'Unknown'
end

def convert_qtype(old)
  if old == 'bool'
    return 'radio'
  end
  if old == 'choice'
    return 'select'
  end
  if old == 'check'
    return 'checkbox'
  end
  return old
end

old.each do | record |
  model = record['model']
  pk = record['pk']
  fields = record['fields']
  if model == 'questionnaire.category'
    categories[pk] = fields['name']
  end
  if model == 'questionnaire.question'
    q_name = "question_#{pk}"
    question_options[q_name] = fields['options']
    questions[q_name] = {
      'category' => categories[fields['category']].downcase.gsub(' ', '-'),
      'text' => fields['text'],
      'q_type' => convert_qtype(fields['q_type']),
      'short_name' => fields['api_name']
    }
  end
  if model == 'questionnaire.option'
    old_options[pk] = fields['text']
  end
  if model == 'questionnaire.rdfprefix'
    @prefixes[fields['short']] = fields['full']
  end
end

questions.each do |key, question|
  if question['q_type'] == 'radio'
    options["#{key}:yes"] = {
      'text' => 'Yes',
      'question' => :"#{key}"
    }
    options["#{key}:no"] = {
      'text' => 'No',
      'question' => :"#{key}"
    }
    options["#{key}:na"] = {
      'text' => 'N/A',
      'question' => :"#{key}"
    }
  end
  if question['q_type'] == 'text'
    options["#{key}:text"] = {
      'text' => 'Response',
      'question' => :"#{key}"
    }
  end
  if question['q_type'] == 'int'
    options["#{key}:int"] = {
      'text' => 'Number',
      'question' => :"#{key}"
    }
  end
  if question['q_type'] == 'select' or question['q_type'] == 'checkbox'
    question_options[key].each do |opt|
      options["#{key}:option_#{opt}"] = {
        'text' => old_options[opt],
        'question' => :"#{key}"
      }
    end
  end
end

old.each do | record |
  model = record['model']
  pk = record['pk']
  fields = record['fields']
  q_name = "question_#{fields['question']}"
  question = questions[q_name]
  if model == 'questionnaire.statement'
    triples["triple_#{pk}"] = {
      'option' => find_option(fields, question, q_name),
      's' => convert_rdf(fields['subject']),
      'p' => convert_rdf(fields['predicate']),
      'o' => convert_rdf(fields['obj'])
    }
  end
end

File.open('questions.yml', 'w') do |f|
  f.write(questions.to_yaml)
end

File.open('options.yml', 'w') do |f|
  f.write(options.to_yaml)
end

File.open('triples.yml', 'w') do |f|
  f.write(triples.to_yaml)
end
