FactoryGirl.define do
  factory :contract do
    customer
    acquisition_price '350,00'
    delivery_address 'R. teste'
    responsable 'Joao'
    cpf '36576809385'
    rental_period '3'
    discount 0
    initial_date '09-12-2016'
  end
end
