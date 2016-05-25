class Url < ActiveRecord::Base
    before_create :make_key

    private
        def make_key
            self.key = random_str(6)
        end

        def random_str(length)
            
            random_str = ''
            
            for i in (0..length)

                # get a random 0, 1, or 2
                zero_one_or_two = Random.rand(3)

                # if 0, make a random lowercase
                if zero_one_or_two == 0
                    random_num = Random.rand(26) + 97
                    random_char = random_num.chr

                # if 1, make a random uppercase
                elsif zero_one_or_two == 1
                    random_num = Random.rand(26) + 65
                    random_char = random_num.chr

                # if 2, make a random 0-9 num
                else
                    random_num = Random.rand(10)
                    random_char = random_num.to_s
                end

                # append to randon_str
                random_str += random_char

            end

            random_str
        end
end
