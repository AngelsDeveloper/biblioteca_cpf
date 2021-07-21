local cpfsBloqueados = {
    [11111111111] = true,
    [22222222222] = true,
    [33333333333] = true,
    [44444444444] = true,
    [55555555555] = true,
    [66666666666] = true,
    [77777777777] = true,
    [88888888888] = true,
    [99999999999] = true
}

function SanitizarCPF(valor)
    local chars
    valor = tostring(valor)
    local stringCompleta = ''

    for i = 1, #valor do
        chars = string.sub(valor, i, i)
        if tonumber(chars) then
            stringCompleta = stringCompleta .. chars
        end
    end

    
    if #stringCompleta == 11 then
        return stringCompleta
    else
        return false
    end
end

function ValidarDigito(cpf, inicio, fim, multiplicator)
    local resto = 0
    local soma = 0
    local mult = multiplicator
    local cpf_valor = string.sub(cpf, inicio, fim)

    for i = 1, #cpf_valor do
        cpf_char = string.sub(cpf_valor, i, i)
        soma = soma + (mult * cpf_char)
        mult = mult - 1
    end

    resto = (soma * 10) % 11

    return resto
end

function FormatarCPF(cpf)
    local chars
    local formato = '###.###.###-##'
    local cpfFormatado = ''

    local pontos = 0

    for i = 1, #formato do
        chars = string.sub(formato, i, i)
        chars_cpf = string.sub(cpf, i - pontos, i - pontos)

        if chars == '#' then
            cpfFormatado = cpfFormatado .. chars_cpf
        else
            pontos = pontos + 1
            cpfFormatado = cpfFormatado .. chars
        end
    end

    return cpfFormatado
end

function FormatarCPF(cpf)
    local chars
    local formato = '###.###.###-##'
    local cpfFormatado = ''

    local pontos = 0

    for i = 1, #formato do
        chars = string.sub(formato, i, i)
        chars_cpf = string.sub(cpf, i - pontos, i - pontos)

        if chars == '#' then
            cpfFormatado = cpfFormatado .. chars_cpf
        else
            pontos = pontos + 1
            cpfFormatado = cpfFormatado .. chars
        end
    end

    return cpfFormatado
end

function ValidarCPF(cpf)
    cpf = SanitizarCPF(cpf)

    if not cpf then
        return false
    elseif cpfsBloqueados[tonumber(cpf)] then
        return false
    end

    local primeirodigito = ValidarDigito(string.sub(cpf, 1, 9), 1, 9, 10)
    local segundodigito = ValidarDigito(string.sub(cpf, 1, 9) .. primeirodigito, 1, 10, 11) 
    
    local digitoscertos = primeirodigito .. segundodigito

    local digitos = string.sub(cpf, 10, 10) .. string.sub(cpf, 11, 11)

    if not (digitos == digitoscertos) then
        return false
    end

    return FormatarCPF(cpf)
end

return {
    SanitizarCPF = SanitizarCPF,
    FormatarCPF = FormatarCPF,
    ValidarCPF = ValidarCPF,
}