# MDWA - Documentos de Pessoa

Cria o cadastro de documentos para pessoas, utilizando modelos MDWA.

## Instalação

Adicione ao Gemfile:

    gem 'mdwa_documento_pessoa'

Rode o bundle:

    $ bundle

Ou instale diretamente do Rubygems:

    $ gem install mdwa_documento_pessoa

## Utilização

Crie uma entidade MDWA referenciando da seguinte forma:

		require 'mdwa/dsl'
		MDWA::DSL.entities.register "Cliente" do |e|
			#...
			e.association do |a|
	    	a.type = 'one_to_one'
	    	a.destination = 'DocumentoPessoa' 
	    	a.composition = true
	  	end
  	end

A maior parte do código é gerada automaticamente, porém em alguns trechos é necessário código manual:
Na view que inclui a parcial do cadastro de endereços, é necessário especificar qual o objeto (params) que referencia o endereço. Para isso utilize:
		
		<%= render 'a/enderecos/form_fields', :f => ff, :tipo => 'a_cliente' %>

O controller que referencia o endereço também ter adaptações para indicar a cidade:
		class A::ClientesController ...

			def create
				@cliente = A::Cliente.new(params[:a_cliente])
		    @cliente.endereco.cidade_id = params[:cidade_id]
		    ...
			end

			def update
				@cliente.attributes = params[:a_cliente]
		    @cliente.endereco.cidade_id = params[:cidade_id]
		    saved_ok = @cliente.save
			end
		end

Boa sorte.