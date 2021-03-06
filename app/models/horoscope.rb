#Horoscope class has a text horoscope and refers to a user
class Horoscope < ActiveRecord::Base
  belongs_to :user
  def horoscope_generator
    # text_one - _five sample different parts of a horoscope to create randomly generated horoscope.
    def text_one
      words = ['Today', 'This week', 'Soon', 'Before you know it', 'Now is the time that',
               'Your wise advice is that soon', 'What you need to know is soon', 'The stars say that',
               'All things being equal, ', 'No doubt,', 'All signs point to the fact that',
               'With Gemini rising,', 'All signs say that', 'The stars say that', 'It is clear that']

      output = words.sample
      output
    end

    def text_two
      words = ['meet', 'learn', 'find', 'discover', 'realize', 'uncover', 'come to terms with', 'own', 'come to realize']

      output = words.sample
      output
    end

    def text_three
      words = ['something that was lost', 'something you forgot about',
               'something you never knew you deserved', 'something important',
               'a fact from your history', 'the facts surrounding an event from when you were younger',
               'a truth that was once considered false', 'a fact that was once considered absurd or silly',
               'an item that was lost that had significance to you',
               'an item you own, like a broken watch or a broken clock',
               "a photograph in black and white. It's of a person who is no longer with us",
               'something from your childhood, such as a stuffed animal, toy or keepsake']

      output = words.sample
      output
    end

    def text_four
      words = ['mean the most to you', 'become important to you', 'become important to you once again',
               'start to mean something to you', 'take on a new meaning to you', 'take on new meaning in your life',
               'mean something to you', 'make you re-think how you treated someone earlier in your life',
               'think about how you treat the people around you', 'make you think about how you treat your children or family members',
               'make you consider being more compassionate to those less fortunate than you',
               'make you think twice before taking a risk in your life', 'make you rethink things',
               'give you pause to how you live your life', 'force you to remember things gone by']

      output = words.sample
      output
    end

    def text_five
      words = ['Sieze this day as your own', "Don't let this opportunity pass you by",
               'Own this day', 'Make this day your own', 'Consider what you will do about this',
               'Remember that this is your opportunity and no one can take it away from you',
               'So man up and make it happen', 'Take this as your gentle nudge in the right direction',
               'So just consider this as you go into today', "If this doesn't make sense, it will as your day goes on",
               "It's just a word of wisdom", 'Something to bear in mind as you go about your day',
               'This is better advice than lucky numbers', "Don't just sit around, take this advice and run with it",
               'Now you know, so take action', 'This means a lot to you, so act on it',
               'Why not get started with the rest of your life today',
               "You can be anything you want, so don't wait any longer",
               'You are a strong, sexy beast, so just get serious and make it happen',
               'The power is within you, so just make it happen']

      output = words.sample
      output
    end

    def text_six
      words = ['When situations like this arise, you can warm your soul with',
               'The only way to handle this oncoming life change is to drink a',
               'What you need to always remember is that at the end of the day you could aways use a',
               "If this get's you down, the thing to get you up is a",
               'The only cure we can perscribe for this is to drink a',
               'When the stars align for you in this way, it calls for a',
               'Be strong in your will, and drink a strong']

      output = words.sample
      output
    end
    
    #Final horoscope combines all text into a final single formatted string to be saved in the database and displayed in the command line
    current_drink = Drink.find(drink_id)
    ingredients = Recipe.get_ingredients(drink_id)
    # binding.pry
    final_horoscope = "\n.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:.\n\e[1m\n Your Drunkoscope©\n Sun Sign: #{self.user.sign.capitalize}\e[0m \n
      #{text_one} you will #{text_two} #{text_three}, and it will #{text_four}. #{text_five}.\n
       #{text_six} \e[5m#{current_drink.drink_name}\e[0m \n\n\e[1mInstructions:\e[0m #{current_drink.instructions}\n\n\e[1mIngredients:\e[0m\n"
    ingredients.each { |ingredient| final_horoscope << "#{ingredient}\n" }

    self.horoscope = final_horoscope
    save
    final_horoscope
  end

  #returns the last three created horoscopes in the databaase
  def self.get_last_3_horoscopes(user_id)
    Horoscope.where(user_id: user_id).last(4)
  end
end
