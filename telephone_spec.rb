require 'rspec'

require "spec_helper"

require_relative 'telephone'

describe KillerZoo do
	@raptor = Raptor.new('Melkor')
	
	describe Raptor do
		describe "#initialize" do
			it "has a name" do
				@raptor.name.should eq 'Melkor'
			end
			it "has an initial health between 30 and 40" do
				@raptor.health.should be >= 30
				@raptor.health.should be <= 40
			end
		end

		describe "@attack_factor" do
			it "is the range of potential damage" do
				@attack_factor = (20..25)
			end
		end

		describe "#attack" do
			it "generates an attack between 20 and 25" do
				@raptor.attack.should be >= @attack_factor.min
				@raptor.attack.should be <= @attack_factor.max
			end
		end

		describe "#take_damage!" do
			it "absorbs damage/reduces health and returns new health" do
				dmg_val = 10
				@raptor_health = @raptor.health
				@raptor.take_damage!(dmg_val).should be < @raptor_health
			end
		end

		describe "#train!" do
			it "increases @attack_factor.max by 5" do
				rap_att_fact = @raptor.attack_factor
				@raptor.train!

				(@raptor.attack_factor - rap_att_fact).should eq 5
			end
		end
	end

	@bst = BearSharkTopus.new('Boagrius')

	describe BearSharkTopus do
		describe "#initialize" do
			it "has a name" do
				@bst.name.should eq 'Boagrius'
			end
			it "has an initial health between 40 and 50" do
				@bst.health.should be >= 40
				@bst.health.should be <= 50
			end
		end

		describe "@attack_factor" do
			it "is the range of potential damage" do
				@attack_factor = (15..20)
			end
		end

		describe "#attack(opponent)" do
			it "generates an attack between 15 and 20" do
				@raptor.attack.should be >= @attack_factor.min
				@raptor.attack.should be <= @attack_factor.max
			end
		end

		describe "#take_damage!" do
			it "absorbs damage/reduces health and returns new health" do
				dmg_val = 10
				@bst_health = @bst.health
				@bst.take_damage!(dmg_val).should be < @bst_health
			end
		end

		describe "#train!" do
			it "increases @attack_factor.max by 4" do
				bst_att_fact = @bst.attack_factor
				@bst.train!
				
				(@bst.attack_factor - bst_att_fact).should eq 4
			end
		end
	end

	describe CageMatch do

		@cagematch = CageMatch.new(@raptor,@bst)

		@raptor = Raptor.new('Melkor')
		@bst = BearSharkTopus.new('Boagrius')
		describe "#initialize" do
			it "takes two animal contestants" do
				describe "#fighter_one / #fither_two" do
					@cagematch.fighter_one.name.should eq 'Melkor'
					@cagematch.fighter_two.name.should eq 'Boagrius'
				end
			end
		end

		describe "#attack(opponent)" do
			it "calls an attack from one fighter and applies it to the other" do
				@bst_health = @bst.health
				@bst.take_damage!(@raptor.attack)
				@bst.health.should be < @bst_health

				@raptor_health = @raptor.health
				@raptor.take_damage!(@bst.attack)
				@raptor.health.should be < @raptor_health
			end
		end
		describe "#rumble!" do

		@cagematch = CageMatch.new(@raptor,@bst)

		@raptor = Raptor.new('Melkor')
		@bst = BearSharkTopus.new('Boagrius')

			it "applies one attack from each fighter to the other" do
				@raptor_health = @raptor.health
				@bst_health = @bst.health

				@cagematch.rumble!
				
				@bst.health.should be < @bst_health
				@raptor.health.should be < @raptor_health
			end
		end
	end
end
# 	KillerZoo
# Create a few Animal classes. Animals will track their own health and have an #attack method. Each animal will have different attack ratings. How about adding a method that trains the animal to make it more deadly?

# The KillerZoo class should accept animals for a cage fight and determine the winner after calling #attack on each animal and then calculating the remaining health of the opponent. It should be possible to print a log of the attacks from each animal and the damage inflicted.
