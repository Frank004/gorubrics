module ApplicationHelper
# Boolean for Event#-----------------------------------------------------------------
  def boolean_event(boolean)
      boolean ? 'Cerrado' : 'Abierto'
  end

# Boolean for gender#-----------------------------------------------------------------
  def boolean_gender(boolean)
      boolean ? 'M' : 'F'
  end

end
