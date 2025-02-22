# frozen_string_literal: true

class Pokemon < ApplicationRecord
  include FindByCapitalCase

  validates :name, :poke_id, presence: true
  validates :poke_id, uniqueness: true

  has_many :pets, dependent: :destroy
  has_many :pokemon_abilities, class_name: 'PokemonAbility', dependent: :nullify
  has_many :abilities, through: :pokemon_abilities, dependent: :nullify, class_name: 'Ability'
  has_many :pokemon_poke_types, class_name: 'PokemonPokeType', dependent: :nullify
  has_many :poke_types, through: :pokemon_poke_types, dependent: :nullify, class_name: 'PokeType'

  accepts_nested_attributes_for :poke_types
  accepts_nested_attributes_for :abilities
end
