#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative '../config/application'

require 'pry'
require 'pry-byebug'

Nova::Application.start(:db)
Nova::Application.start(:persistence)

container = Nova::Application['container']
relations = container.relations

klasses = [
  { name: 'Druid', icon: 'druid' },
  { name: 'Hunter', icon: 'hunter' },
  { name: 'Mage', icon: 'mage' },
  { name: 'Paladin', icon: 'paladin' },
  { name: 'Priest', icon: 'priest' },
  { name: 'Rogue', icon: 'rogue' },
  { name: 'Shaman', icon: 'shaman' },
  { name: 'Warlock', icon: 'warlock' },
  { name: 'Warrior', icon: 'warrior' },
]

specializations = [
  { name: 'Balance', icon: 'balance', klass_id: relations[:klasses].where(name: 'Druid').select(:id).dataset },
  { name: 'Feral', icon: 'feral', klass_id: relations[:klasses].where(name: 'Druid').select(:id).dataset },
  { name: 'Restoration', icon: 'restoration', klass_id: relations[:klasses].where(name: 'Druid').select(:id).dataset },

  { name: 'Beast Mastery', icon: 'beast_mastery', klass_id: relations[:klasses].where(name: 'Hunter').select(:id).dataset },
  { name: 'Marksmanship', icon: 'marksmanship', klass_id: relations[:klasses].where(name: 'Hunter').select(:id).dataset },
  { name: 'Survival', icon: 'survival', klass_id: relations[:klasses].where(name: 'Hunter').select(:id).dataset },

  { name: 'Arcane', icon: 'arcane', klass_id: relations[:klasses].where(name: 'Mage').select(:id).dataset },
  { name: 'Fire', icon: 'fire', klass_id: relations[:klasses].where(name: 'Mage').select(:id).dataset },
  { name: 'Frost', icon: 'frost', klass_id: relations[:klasses].where(name: 'Mage').select(:id).dataset },

  { name: 'Holy', icon: 'holy', klass_id: relations[:klasses].where(name: 'Paladin').select(:id).dataset },
  { name: 'Protection', icon: 'protection', klass_id: relations[:klasses].where(name: 'Paladin').select(:id).dataset },
  { name: 'Retribution', icon: 'retribution', klass_id: relations[:klasses].where(name: 'Paladin').select(:id).dataset },

  { name: 'Discipline', icon: 'discipline', klass_id: relations[:klasses].where(name: 'Priest').select(:id).dataset },
  { name: 'Holy', icon: 'holy', klass_id: relations[:klasses].where(name: 'Priest').select(:id).dataset },
  { name: 'Shadow', icon: 'shadow', klass_id: relations[:klasses].where(name: 'Priest').select(:id).dataset },

  { name: 'Assassination', icon: 'assassination', klass_id: relations[:klasses].where(name: 'Rogue').select(:id).dataset },
  { name: 'Combat', icon: 'combat', klass_id: relations[:klasses].where(name: 'Rogue').select(:id).dataset },
  { name: 'Subtlety', icon: 'subtlety', klass_id: relations[:klasses].where(name: 'Rogue').select(:id).dataset },

  { name: 'Elemental', icon: 'elemental', klass_id: relations[:klasses].where(name: 'Shaman').select(:id).dataset },
  { name: 'Enhancement', icon: 'enhancement', klass_id: relations[:klasses].where(name: 'Shaman').select(:id).dataset },
  { name: 'Restoration', icon: 'restoration', klass_id: relations[:klasses].where(name: 'Shaman').select(:id).dataset },

  { name: 'Affliction', icon: 'affliction', klass_id: relations[:klasses].where(name: 'Warlock').select(:id).dataset },
  { name: 'Demonology', icon: 'demonology', klass_id: relations[:klasses].where(name: 'Warlock').select(:id).dataset },
  { name: 'Destruction', icon: 'destruction', klass_id: relations[:klasses].where(name: 'Warlock').select(:id).dataset },

  { name: 'Arms', icon: 'arms', klass_id: relations[:klasses].where(name: 'Warrior').select(:id).dataset },
  { name: 'Fury', icon: 'fury', klass_id: relations[:klasses].where(name: 'Warrior').select(:id).dataset },
  { name: 'Protection', icon: 'protection', klass_id: relations[:klasses].where(name: 'Warrior').select(:id).dataset },
]

recruitments = specializations.map do |specialization|
  { count: 0, note: '', specialization_id: relations[:specializations].where(name: specialization[:name], klass_id: specialization[:klass_id]).select(:id).dataset }
end

relations[:klasses].multi_insert(klasses)
relations[:specializations].multi_insert(specializations)
relations[:recruitments].multi_insert(recruitments)

Pry.start
