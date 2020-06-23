Feature: Teste do moneygram

  Background:
    * def auth = { auth: '586.178.118-46|ECommerce|20200616.155419877|2760|1591214228983|MCwCFH6x3xRD5wlIJvtf9EQBmL5wMF+CAhQ6rj+IfU0nChCcWF++Q3FsOIyIqQ==', authorization : '$2a$10$A9ovfYI4WyHCfd1TVSFYe.0a7Ju9ACgjY6KBG02fY6yYVaPhDQxlO'}
    * url "https://b8pybk7hl9.execute-api.sa-east-1.amazonaws.com/tst/white-label/remessas/api/v1/moneygram/paises/253/moedas/132"
    * headers auth

    Scenario: Consulta Taxas

      * def taxa =
      """
        {
        "valor_usd": 1000.00,
        "valor_real": 0.00,
        "valor_moeda": 0.00
        }
      """

      Given path 'taxas'
      And request taxa
      When method post
      Then status 200

