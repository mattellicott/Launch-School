**begin/rescue**

```ruby
begin
  # put code at risk of failing here
rescue TypeError
  # take action
rescue NoMethodError, TypeError # Multiple Errors handled with the same action
  # take other action
end
```
<br><br>

**ensure**

`ensure` comes after the last `rescue` clause. It will always execute whether an exception is raised or not. It is critical that the code within the `ensure` block does not raise an exception. If it does, then it would mask any exceptions raised from the `begin/rescue` block.<br>
Example of use is resource management. It could ensure a file is closed even if an exception is raised.
<br><br>

**retry**

`retry` must be used within the `rescue` block. It will redirect the program back to the `begin` statement. You should limit how many times the `retry` block executes.
```ruby
RETRY_LIMIT = 5
begin
  attempts = attempts || 0
  # do something
rescue
  attempts += 1
  retry if attempts < RETRY_LIMIT
end
```
<br><br>

**raise**

`raise` defaults to a `RuntimeError` unless another exception is specified.

```ruby
raise TypeError.new("Something went wrong!")
raise TypeError, "Something went wrong!"
```
