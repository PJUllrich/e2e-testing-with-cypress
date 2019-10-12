context('Quantity', () => {
  before(() => {
    cy.createTable()
    cy.get('[data-cy=quantity]').first().as('quantity')
    cy.get('[data-cy=btn-dec]').first().as('btn-dec')
  })

  it('cannot be smaller than 0', () => {
    cy.get('@quantity').then(($span) => {
      const quantityBefore = parseInt($span.text())

      for (var idx of Array(quantityBefore + 1).keys()) {
        cy.get('@btn-dec').click().then(() => {
          if (idx == 0) {
            const quantityAfter = parseInt($span.text())
            expect(quantityAfter).to.equal(0)
          }
        })
      }
    })
  })
})