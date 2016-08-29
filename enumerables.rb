##################################
#####       Enumerables      #####
##################################

  #Enumerable is a module that is mixed in to both Array and Hash (and a couple other classes too, but those are the main ones).
# fix definition Trish
##################################
#####     LEARNING GOALS     #####
##################################

# Recap object compositi

# Try out a Ruby mixin

# Learn about the module Enumerable

# Discover some really, really useful methods provided by Enumerable



##################################
#####    USING MODULES TO    #####
#####      MAKE MIXINS       #####
##################################

 # Mixin is a collection of methods in a module that is composed into a Ruby class via either include (for instance methods) or extend (for class methods).
 # inlcude
 # extend

          ######################################
          ##  Dynamically extend String class ##
          ######################################

          #Ruby classes can by dynamically extended, meaning that, at any point after it is declared, a class can be re-opened and modified.

          class String # <= wat?!? We can do this? We sure can!
            def smiley_spaces
              self.gsub(/\s+/, " :) ")
            end
          end
#
          # I :) am :) a :) string
          # special functionality for new objects.
          # puts "I am a string".smiley_spaces
          #regex pattern recogniton

          ####################
          ##Our First Mixin!##
          ####################
# INCLUDE mix in. method within the mix in.
          module AllSmiles
# instance method. Can only call it on the instance of the class.@ use self, when you want to use it again.
# if you want to reuse methods in multiple classes. s
            def to_smile
              ":)" * length
            end
          end

          class String
# extended string class.
            include AllSmiles
          end
          # puts "I'm a new string!".to_smile
          # puts "abc".to_smile
# the result will be smiley faces for the length
          class Array
            include AllSmiles
          end
          # puts [1, 2, 3, 4].to_smile


          class Hash
            include AllSmiles
          end
          # example_hash = {"1" => "one", "2" => "two"}
          # puts example_hash.to_smile
          # => :):)

          # class Fixnum
          #   def length
          #     return self
          #   end
          #   include AllSmiles
          # end
          #
          # puts 3.to_smile
          # broke, but because length cannot be called on a fixed num.
##################################
#####       ENUMERABLES      #####
##################################
# print Enumerable.instance_methods
# print Hash.instance_methods
# lists the instance methods on the Enumerable class.
# Enumerable is mixed into other classes.
# .sort
        ####################
        ## Map & Collect ##
        ####################

        #These do the same thing. The iterate the collection and return an array of the results of the block evaluation.

        #USING EACH
          results = []
          [1,2,3].each { |n| results << n ** 2 }
          # print results
          # another more familar way to write the above.
          # results = []
          # [1,2,3].each do |n|
          #   results << n ** 2
          # end
          # print results
          # .each will return and manipulated items.



        #USING MAP OR COLLECT
          results = [1,2,3].collect { |n| n ** 2 }
          # print results

          # you can do that for collect but not each do. It



        ####################
        ## sort & sort_by ##
        ####################
        # Returns an array containing the items sorted by either their own method, or by using the results of the supplied block.


        # print [1, 3, 6, 3, 2, 346, 6, 7].sort # => [1, 2, 3, 3, 6, 6, 7, 346]

#.all will give us an array of all the products.

        # Product.all.sort_by do |product|
        #   product.margins_average_year_over_year(adjust_for_inflation: true)
        # end


        #Note: Use sort when the sorting calculation/algorithm is inexpensive, in terms of memory required and/or objects allocated. Use sort_by when the calculation/algorithm is expensive. sort_by uses a Schwartzian Transform to minimize the cost of sorting things that require expensive caluclations. Err on the side of using sort unless you explicitely identify it as a performance bottleneck.

        #####################
        ##    min, max,    ##
        ## min_by & max_by ##
        #####################
        #These methods find the maximum and minimum values in a collection. You can use max and min if a collection's values can be directly compared (i.e., they are all Float and Fixnum values).
        # to_a: creates an array.
        # numbers = (1..100).to_a

        numbers = (1..100).to_a.sample(15)
        # random array of 15 intergers.
        # .to_a.sample(15)
        # print numbers
#
        #FINDING MAX WITH EACH
        # print numbers
          max = 0
          numbers.each do |num|
            max = num if num > max
          end
          # puts max
        #highest numner in array

        #USING MAX AND MIN
          # print numbers
          # puts  numbers.max
          # puts  numbers.min


        #If the values are not directly comparable, the min_by and max_by do similar work but take a block in which you can derive the values to compare:
        # Bank Module with Account Class.
        # all is going to return an array of bankaccount objects.
        # .balance is a method for account class.


          # least = Bank::Account.all.min_by { |account| account.balance }
          # most  = Bank::Account.all.max_by { |account| account.balance }


        #####################
        ## select & reject ##
        #####################

        # Use these methods to filter collections by a conditional evaluation.

        #Select will filter for elements where the condition is true
        #the gollum method.
          # print (1..100).to_a.select {|n| n % 10 == 0 }

       #Reject filters for elements where the condition is false.
          print (1..15).to_a.reject { |n| n % 5 == 0 }
          # all but these;  5 10 15.... so reject returns:
          # => 1,2,3,4,6,7,8,9,11,12,13,14

          print Range.instance_methods

a = ["red", "1", "hide"]
b = ["white", "2", "and"]
c = ["blue", "3", "seek"]

a.zip(b,c)
# => it will zip up the responses for red white and blue.





#           irb(main):001:0> a = "red", "1", "hide"
# => ["red", "1", "hide"]
# irb(main):002:0> b = "white", "2", "and"
# => ["white", "2", "and"]
# irb(main):003:0> c = "blue", "3", "seek"
# => ["blue", "3", "seek"]
# irb(main):004:0> a.zip(b,c)
# => [["red", "white", "blue"], ["1", "2", "3"], ["hide", "and", "seek"]]
# irb(main):005:0>
