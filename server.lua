local methods = {
    signIn = function(data)
        local result<const> = MySQL.query.await('SELECT * FROM accounts WHERE email = ?', {data.email})
        if not result[1] then return {status: false, message: 'Email não Cadastrado'} end

        local isPasswordValid<const> = VerifyPasswordHash(data.password, result[1].password)
        if not isPasswordValid then return {status: false, message: 'Senha Inválida'} end

        return {status: true, message: 'Login efetuado com sucesso!'}
    end,

    register = function(data)
        local result<const> = MySQL.query.await('SELECT * FROM accounts WHERE email = ?', {data.email})
        if result[1] then return {status: false, message: 'Email já está Cadastrado'} end

        local passwordHash<const> = GetPasswordHash(data.password)
        local id = MySQL.insert.await('INSERT INTO accounts (email,password) VALUES(?, ?)', {data.email, passwordHash})

        return {status: true, message: 'Conta Cadastrada com Sucesso!'}
    end
}

RegisterServerEvent('req:backend', function(promiseId, action, args)
    local source = source
    local result<const> = methods[action](args)
    TriggerClientEvent('res:backend', source, promiseId, result)
end)