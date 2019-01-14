def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, number)
  pet_shop[:admin][:pets_sold] += number
end

def stock_count(pet_shop)
  return pet_shop[:pets].length()
end

def pets_by_breed(pet_shop, breed)
  total_of_breed = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      total_of_breed << pet
    end
  end
  return total_of_breed
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
      pet_shop[:pets].delete(pet)
    end
  end
  return nil
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets] << new_pet
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, pet)
  customer[:pets] << pet
end

def customer_can_afford_pet(customer, pet)
  customer_cash(customer) >= pet[:price]
end

def sell_pet_to_customer(pet_shop, pet, customer)
  # Check if the pet is in stock
  # Check if the customer can afford the pet
  if pet && customer_can_afford_pet(customer, pet)
  # Remove cash from customer
      remove_customer_cash(customer, pet[:price])
  # Add cash to petshop
      add_or_remove_cash(pet_shop, pet[:price])
  # Remove pet from petshop stock
      remove_pet_by_name(pet_shop, pet)
  # Add the pet to the customer
      add_pet_to_customer(customer, pet)
  # Increase number of pets sold
      increase_pets_sold(pet_shop, 1)
    # else
    #   return nil
  end
  # else
  #   return nil
end
