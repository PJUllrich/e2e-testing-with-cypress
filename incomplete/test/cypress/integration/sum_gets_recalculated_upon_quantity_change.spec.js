context('Sum gets recalculated upon quantity change', () => {
  beforeEach(() => {
    cy.createTable()
  })

  it('increases sum upon quantity increase', () => {
    cy.get('[data-cy=sum]').then(($span) => {
      const sumBefore = parseFloat($span.text().split('€')[0])

      cy.get('[data-cy=btn-inc]').first().click().then(() => {
        const sumAfter = parseFloat($span.text().split('€')[0])

        expect(sumBefore).to.be.lessThan(sumAfter)
      })
    })
  })

  it('decreases sum upon quantity decrease', () => {
    cy.get('[data-cy=sum]').then(($span) => {
      const sumBefore = parseFloat($span.text().split('€')[0])

      cy.get('[data-cy=btn-dec]').first().click().then(() => {
        const sumAfter = parseFloat($span.text().split('€')[0])

        expect(sumBefore).to.be.greaterThan(sumAfter)
      })
    })
  })
})