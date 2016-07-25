class AccountsController < ApplicationController
    def index
        authenticate_user!

        # found_accounts = Account.where({user_id: current_user.id})
        #
        # if found_accounts.length == 0
        #     found_accounts = {error: "No accounts found for your account"}
        # end
        #
        # render(json: found_accounts)

        # OR

        render(json: current_user.accounts)

    end

end
