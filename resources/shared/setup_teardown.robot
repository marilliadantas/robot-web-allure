*** Settings ***
Resource    ../main.robot

*** Keywords ***
Acessar site
    Open Browser  ${geral.URL}  ${geral.Browser}  options=${geral.Headless}
    Maximize Browser Window

Preencher
    [Arguments]    ${locator}       ${variavel}
    Wait Until Element Is Visible   ${locator}      5
    Input Text     ${locator}       ${variavel}

Clicar
    [Arguments]      ${locator}
    Wait Until Element Is Visible   ${locator}      5
    Click Element    ${locator}

Limpar campo
    [Arguments]      ${locator}
    Wait Until Element Is Visible   ${locator}      5
    Clear Element Text    ${locator} 

Validar mensagem
    [Arguments]     ${locator}      ${texto} 
    Wait Until Element Is Visible   ${locator}      5
    Element Text Should Be          ${locator}    ${texto}     

Validar URL
    [Arguments]            ${url}
    Location Should Be     ${url}

Validar mensagens
    [Arguments]     ${alerta1}    ${alerta2}
    Element Should Contain    ${msgErro}    ${alerta1} 
    Element Should Contain    ${msgErro}     ${alerta2} 

Fechar navegador
    Screenshot
    Close Browser

Screenshot
    Capture Page Screenshot          ${OUTPUT_DIR}/screenshot.png
    Attach File                      ${OUTPUT_DIR}/screenshot.png