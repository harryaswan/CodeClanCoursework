require('pry-byebug')
#binding.pry
ACCOUNTS = [
  {
    holder_name: "Jay",
    amount: 55,
    type: "business"
  },
  {
    holder_name: "Rick",
    amount: 1,
    type: "personal"
  },
  {
    holder_name: "Keith",
    amount: 500,
    type: "business"
  },
  {
    holder_name: "Valerie",
    amount: 100,
    type: "personal"
  },
  {
    holder_name: "Michael",
    amount: 5,
    type: "personal"
  },
  {
    holder_name: "Kate",
    amount: 2000,
    type: "business"
  },
  {
    holder_name: "Tony",
    amount: 150,
    type: "personal"
  },
  {
    holder_name: "Sandy",
    amount: 4500,
    type: "business"
  }
]

def number_of_bank_accounts()
    return ACCOUNTS.length
end

def first_bank_account_holder()
    return ACCOUNTS[0][:holder_name]
end

def bank_account_owner_names()
    # names = []
    # for x in ACCOUNTS
    #     names << x[:holder_name]
    # end
    # return names
    return get_element_as_array(:holder_name)

end

def total_cash_in_bank()
    # cash = 0
    # for x in ACCOUNTS
    #     cash += x[:amount]
    # end
    # return cash

    return total_cash(ACCOUNTS)

end

def average_bank_account_value()
    return (total_cash_in_bank()/number_of_bank_accounts())
end

def largest_bank_account_holder()
    # amounts = []
    # for x in ACCOUNTS
    #     amounts << x[:amount]
    # end

    amounts = get_element_as_array(:amount)

    return bank_account_owner_names()[amounts.index(amounts.max)]

    # ALTERNATIVE SOLUTION
    # result = {}
    #
    # for hash in ACCOUNTS
    #     result[hash[:amount]] == hash[:holder_name]
    # end
    # return result.fetch(result.keys.max)

end

def largest_personal_account_holder()
    amounts = []
    people = []
    for x in ACCOUNTS
        if x[:type] == "personal"
            amounts << x[:amount]
            people << x[:holder_name]
        end
    end

    return people[amounts.index(amounts.max)]
end

def total_cash_in_business_accounts()
    # cash = 0
    # for x in ACCOUNTS
    #     cash += x[:amount] if x[:type] == "business"
    # end
    # return cash
    #return total_cash_in_accounts_type("business")

    return total_cash(all_accounts_of_type("business"))

end

def total_cash(arr)
    cash = 0
    for x in arr
        cash += x[:amount]
    end
    return cash
end

def get_element_as_array(element_as_symbol)
    elements = []
    for x in ACCOUNTS
        elements << x[element_as_symbol]
    end
    return elements
end

def all_accounts_of_type(type_as_string)
    accounts = []
    for x in ACCOUNTS
        if x[:type] == type_as_string
            accounts << x
        end
    end
    return accounts
end

def total_cash_in_accounts_type(type_as_string)
    cash = 0
    for x in ACCOUNTS
        cash += x[:amount] if x[:type] == type_as_string
    end
    return cash
end
