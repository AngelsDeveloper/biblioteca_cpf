function SanitizarCPF(valor, max)
    local tamanho = 0
    local chars
    valor = tostring(valor)
    local stringCompleta = ''

    for i = 1, #valor do
        chars = string.sub(valor, i, i)
        if tonumber(chars) then
            tamanho = tamanho + 1
            stringCompleta = stringCompleta .. chars
        end
    end

    
    if tamanho == 11 then
        return stringCompleta
    else
        return false
    end
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
    end

    ------------------------------------------------------------------
    ----------------------- PRIMEIRA VALIDAÇÃO -----------------------
    ------------------------------------------------------------------
    local cpfsBlocked = {
        [1] = '11111111111',
        [2] = '22222222222',
        [3] = '33333333333',
        [4] = '44444444444',
        [5] = '55555555555',
        [6] = '66666666666',
        [7] = '77777777777',
        [8] = '88888888888',
        [9] = '99999999999',
    }

    for i = 1, #cpfsBlocked do
        if cpf == cpfsBlocked[i] then
            return false
        end
    end
    
    local array = {

    }

    for i = 10, 2, -1 do
        table.insert(array, i)
    end

    local chars = 0
    local calculo = 0
    local ultimosdigitos = string.sub(cpf, 10, 10) .. string.sub(cpf, 11, 11)

    for i = 1, 9 do
        chars = string.sub(cpf, i , i)
        calculo = (chars * array[i]) + calculo
    end

    resto = (calculo * 10) % 11
    calculo = (calculo * 10) / 11

    if not (tostring(resto) == string.sub(ultimosdigitos, 1, 1)) then
        return false
    end

    ------------------------------------------------------------------
    ----------------------- SEGUNDA VALIDAÇÃO -----------------------
    ------------------------------------------------------------------
    
    local array2 = {}
    
    for i = 11, 2, -1 do
        table.insert(array2, i)
    end
    
    calculo = 0
    local cpf2 = ''
    
    for i = 1, 9 do
        chars = string.sub(cpf, i , i)
        cpf2 = cpf2 .. chars
    end

    cpf2 = cpf2 .. resto

    for i = 1, 10 do
        chars = string.sub(cpf2, i , i)
        calculo = (chars * array2[i]) + calculo
    end

    resto = (calculo * 10) % 11
    calculo = (calculo * 10) / 11

    if not (tostring(resto) == string.sub(ultimosdigitos, 2, 2)) then
        return false
    end
    return FormatarCPF(cpf)

end