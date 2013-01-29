# -*- encoding : utf-8 -*-

require 'rails/generators'
require 'mdwa/dsl'

module MdwaDocumentoPessoa
	class InstallGenerator < Rails::Generators::Base

		source_root File.expand_path("../templates", __FILE__)

		def mdwa
			gem 'brcpfcnpj'
			run 'bundle install'

			copy_file 'requisitos/armazenar_documentos.rb', MDWA::DSL::REQUIREMENTS_PATH + 'armazenar_documentos.rb'
			copy_file 'entidades/documento_pessoa.rb', MDWA::DSL::STRUCTURAL_PATH + 'documento_pessoa.rb'
		end

		def templates
			copy_file 'templates/model.erb', MDWA::DSL::TEMPLATES_PATH + 'documento_pessoa/a/model.erb'
			copy_file 'templates/controller.erb', MDWA::DSL::TEMPLATES_PATH + 'documento_pessoa/a/controller.erb'
			copy_file 'templates/helper.erb', MDWA::DSL::TEMPLATES_PATH + 'documento_pessoa/a/helper.erb'
			directory 'templates/views', MDWA::DSL::TEMPLATES_PATH + 'documento_pessoa/a/views'
		end

		def assets
			copy_file 'assets/documento_pessoa.js.erb', 'app/assets/javascripts/qw3/documento_pessoa.js.erb'
		end

		def locales

			create_file 'config/locales/mdwa.specific.en.yml', "en:\n" unless File.exists?('config/locales/mdwa.specific.en.yml')
			create_file 'config/locales/mdwa.specific.pt-BR.yml', "pt-BR:\n" unless File.exists?('config/locales/mdwa.specific.pt-BR.yml')

			en = File.read( File.join(File.expand_path("../templates", __FILE__), "locales", "mdwa.documento_pessoa.en.yml") )
			pt_br = File.read File.join(File.expand_path("../templates", __FILE__), "locales", "mdwa.documento_pessoa.pt-BR.yml")
			append_file 'config/locales/mdwa.specific.en.yml', en, :after => "en:\n"
			append_file 'config/locales/mdwa.specific.pt-BR.yml', pt_br, :after => "pt-BR:\n"
		end

		def rodar_transformacao
			if yes? "Deseja rodar a transformação dos templates de documento_pessoa?"
				generate "mdwa:transform DocumentoPessoa"
			end
		end

	end
end