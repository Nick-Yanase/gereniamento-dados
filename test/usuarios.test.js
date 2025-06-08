const assert = require('assert');
const db = require('../config/dbConfig');


describe('Testes da tabela usuarios', () => {

    it('Deve retornar todos os usuários', async () => {

        // Usa a versão com Promises 
        const [results] = await db.promise().query('SELECT * FROM usuarios');


        // Verifica que é um array e que contém pelo menos um usuário
        assert.ok(Array.isArray(results));

        assert.ok(results.length > 0, 'A tabela deve conter pelo menos um usuário');

    });
});

