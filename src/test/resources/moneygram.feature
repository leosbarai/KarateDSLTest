Feature: Teste do moneygram

  Background:
    * def auth = { auth: '586.178.118-46|ECommerce|20200616.155419877|2760|1591214228983|MCwCFH6x3xRD5wlIJvtf9EQBmL5wMF+CAhQ6rj+IfU0nChCcWF++Q3FsOIyIqQ==', authorization : 'Auth eyJhbGciOiJIUzUxMiIsInppcCI6IkRFRiJ9.eNqMUcFKw0AQ_Zc9l4WUltreJpM1jGx24uxGCuLBhhw8lBajIIj_7qY2wUPb5DY83rw37823aj93aqOa-rDfN-91o2bqrW0jkiTd-PqhNslyPV8n89XdYqaar2MPLJYd0NaHYxP5z-q-ckjswFIGmdFQki6FS_YBNLLzlQ0gUfMCz5mckQCBNQqB_AMuLwzCAbbgtaeistfEB66lxyrCYzQECWy8hkBPEw5OK48TLkYOJ3oOAi6Q9MDYMX1xWowLkNIfaWKEkdoNclEYwVG57ie3Y51buBlKTE4-GDn_2PgQq8gNCesSJJZnr-3FviADyw_QG3XzJJdUwJM9mSBLlGKBwe7l5xcAAP__.o0pinq32LxdXLJXBaMGLAAegTRincVytcmv3cdLJKGPvYa2yLk9nhVHffNZIpN1vuW5kFHnDW3PtMOLyD8iEnQ'}
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

