FactoryBot.define do
  factory :order do
    postal_code      { '123-4567' }
    state_id         { 2 }
    city             { 'test' }
    address          { 'test' }
    phone_num        { 111_111_111 }
    building         { 'test' }
    token            { 'tok_abcdefghijk00000000000000000' }
  end
end
