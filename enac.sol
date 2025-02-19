pragma solidity ^0.4.19;

// Declaração do contrato "Anac"
contract Anac {

    // Variável "idade" do tipo uint, com valor inicial de 18
    uint idade = 18;

    // Variável pública "owner" que armazena o endereço do proprietário do contrato
    address public owner;

    // Construtor do contrato: executado uma vez durante a implantação
    // Define o proprietário do contrato como o endereço que o criou (msg.sender)
    constructor() public {
        owner = msg.sender;
    }
    
    // Função para alterar o valor da variável "idade"
    // Recebe um novo valor (_idade) e atualiza "idade" se o chamador for o proprietário
    function setIdade(uint _idade) public {
        // Verifica se o endereço que chamou a função é o proprietário
        require(msg.sender == owner, "Apenas o dono pode alterar a idade.");
        // Atualiza o valor da idade
        idade = _idade;
    }

    // Função que retorna o valor atual da variável "idade"
    function getIdade() public view returns (uint) {
        return idade;
    }

    // Função que retorna uma mensagem de categoria com base na nacionalidade e idade
    // Parâmetro "isBrasileiro": true se for brasileiro, false caso contrário
    function getCategoria(bool isBrasileiro) public view returns (string memory) {
        // Se o indivíduo for brasileiro
        if (isBrasileiro) {
            // Verifica se a idade é maior ou igual a 18
            if (idade >= 18) {
                // Retorna mensagem para adultos brasileiros
                return "Adulto Brasileiro: Documentos - RG e, se necessario, Passaporte.";
            } else {
                // Retorna mensagem para crianças ou adolescentes brasileiros
                return "Crianca/Adolescente Brasileiro: Documentos - Certidao de Nascimento/ RG e Autorizacao dos pais.";
            } 
        } else {
            // Se não for brasileiro, retorna mensagem para estrangeiros
            return "Estrangeiro: Documentos - Passaporte e, se aplicavel, Visto.";
        }
    }
}
