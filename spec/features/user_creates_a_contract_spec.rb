require 'rails_helper'

feature 'User creates a contract' do
  scenario 'successfully' do
    customer = create(:customer)

    visit new_contract_path

    select customer.name, from: 'Cliente'
    fill_in 'Equipamentos', with: 'Furadeira'
    fill_in 'Endereço de Entrega', with: 'Rua Vergueiro'
    fill_in 'Responsável na obra', with: 'João da Silva'
    fill_in 'CPF do responsável', with: '4987984984685'
    fill_in 'Prazo de locação', with: '15'
    fill_in 'Data de início', with: '12/09/2016'
    fill_in 'Valor', with: '500'
    fill_in 'Desconto', with: '10'

    click_on 'Criar contrato'

    expect(page).to have_content customer.name
    expect(page).to have_content 'Furadeira'
    expect(page).to have_content 'Rua Vergueiro'
    expect(page).to have_content 'João da Silva'
    expect(page).to have_content '4987984984685'
    expect(page).to have_content '15'
    expect(page).to have_content '12/09/2016'
    expect(page).to have_content '500'
    expect(page).to have_content '10'
    expect(page).to have_content Time.zone.today
  end
  scenario 'should fail if has missing necessary fields' do

    customer = build(:customer)

    visit new_contract_path

    fill_in 'Endereço de Entrega', with: 'Rua Vergueiro'
    fill_in 'Responsável na obra', with: 'João da Silva'
    fill_in 'CPF do responsável', with: '4987984984685'
    fill_in 'Prazo de locação', with: '15'
    fill_in 'Data de início', with: '12/09/2016'
    fill_in 'Valor', with: '500'
    fill_in 'Desconto', with: '10'

    click_on 'Criar contrato'

    expect(page).to have_content('Você não preencheu alguns campos necessários.')

  end
end