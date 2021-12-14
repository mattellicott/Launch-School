# 'Method Lookup Path' is the order which Ruby looks for a method it is trying to execute.
# It follows this order:
#   Class of the object the method is called on
#   Modules included in that class, from last to first
#   The Superclass that the Class inherits from

#   It then repeats the order until there are no more Classes for it to search.
