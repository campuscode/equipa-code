require 'rails_helper'

feature 'visitor visits root page' do
  scenario 'visits navbar links' do
    visit root_path

    expect(page).to have_content('Equipa')
    expect(page).to have_css('img', 'Rafael')

    click_on 'Emitir Contrato'

    expect(page).to have_content 'Responsável na obra'

    click_on 'Cadastrar Equipamento'

    expect(page).to have_content 'Número de Série'

    click_on 'Cadastrar Clientes'

    expect(page).to have_content 'Endereço de faturamento'

    click_on 'Enviar Orçamento'

    expect(page).to have_content 'Mensagem'

  end

  scenario 'views contracts' do
    equipment = create(:equipment)

    conctract1 = create(:contract, equipment: [equipment])
    conctract2 = create(:contract, equipment: [equipment])
    conctract3 = create(:contract, equipment: [equipment])
    conctract4 = create(:contract, equipment: [equipment])

    visit root_path

    expect(page).to have_content 'Campus Code'
    expect(page).to have_content equipment.model
    expect(page).to have_content contract.customer.name
  end
end