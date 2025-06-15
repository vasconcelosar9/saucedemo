*** Settings ***
Resource         ../resources/base.resource
Test Setup       Run Keywords    Acessar página
...    AND    Preencher usuário    standard_user
...    AND    Preencher senha      secret_sauce
...    AND    Submeter login
Test Teardown    Fechar navegador