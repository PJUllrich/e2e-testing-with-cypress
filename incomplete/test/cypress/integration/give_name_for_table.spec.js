context('Give name to table', () => {
  it('gives a name for a table', () => {
    cy.visit('')
      .get('[data-cy=table-name-input]')
      .type('Testy McTestface')
      .type('{enter}')

    cy.get('[data-cy=table-name]').should('have.text', 'Testy McTestface')
  })
})