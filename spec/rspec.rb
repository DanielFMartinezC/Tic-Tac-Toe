require "rspec"
require_relative "../index.rb"

describe TicTacToe do
  let(:game) { TicTacToe.new }

  it "returns a player" do
    expect(game.turn_count).to eq(1)
    expect(game.player).to eq("X")
    game.move(:a1)
    expect(game.turn_count).to eq(2)
    expect(game.player).to eq("O")
  end

  it "returns if a position is NOT taken" do
    expect(game.position_taken?(:a1)).to be_falsy
  end

  it "return if a position is taken" do
    game.turn_count
    expect(game.move(:a1)).to eq("X")
    expect(game.position_taken?(:a1)).to be_truthy
  end

  it "return if someone won" do
    game.turn_count
    expect(game.won).to be_falsy
    game.move(:a1)
    game.move(:a2)
    game.move(:a3)
    expect(game.won).to be_truthy
  end

  it "test draw" do
    expect(game.draw).to be_falsy
    game.turn_count
    game.move(:a1)            #{   a1: 'X', a2: 'O', a3: 'X', 
    game.turn_count            #   b1: 'O', b2: 'X', b3: 'O',  
    game.move(:a2)              #  c1: 'O', c2: 'X', c3: 'X', }
    game.turn_count
    game.move(:a3)
    game.turn_count
    game.move(:b1)
    game.turn_count
    game.move(:b2)
    game.turn_count
    game.move(:b3)
    game.turn_count
    game.move(:c2)
    game.turn_count
    game.move(:c1)
    game.turn_count
    game.move(:c3)
    expect(game.draw).to be_truthy
  end
  
end