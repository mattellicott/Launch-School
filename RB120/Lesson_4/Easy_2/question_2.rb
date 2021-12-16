class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
trip.predict_the_future

# Similar to the previous question, this one concatenates the result of a random
# element from the Array returned by the `choices` method in the `RoadTrip`
# class. It ignores the `choices` method in the `Oracle` class because `RoadTrip`
# class overrides it which keeps it out of the method path lookup.
