# Nexsys - Site Institucional

Site institucional moderno e responsivo para a empresa de consultoria Nexsys, desenvolvido com Astro e React.

## 🚀 Deploy no Dokploy

Este projeto está **100% compatível** com Dokploy e pode ser deployado facilmente seguindo estes passos:

### 📋 Pré-requisitos
- Conta no [Dokploy](https://dokploy.com)
- Repositório Git (GitHub, GitLab, etc.)
- Domínio (opcional, mas recomendado)

### 🐳 Configuração do Docker

O projeto já vem com:
- ✅ **Dockerfile** otimizado para produção
- ✅ **nginx.conf** configurado para SPA
- ✅ **.dockerignore** para builds eficientes
- ✅ **docker-compose.yml** para desenvolvimento local

### 📝 Passos para Deploy

1. **Faça push do código para seu repositório Git:**
   ```bash
   git add .
   git commit -m "feat: add Docker support for Dokploy"
   git push origin main
   ```

2. **No Dokploy Dashboard:**
   - Clique em "New Application"
   - Selecione "From Repository"
   - Conecte seu repositório Git
   - Configure a branch (normalmente `main` ou `master`)

3. **Configurações da Aplicação:**

   **⚠️ IMPORTANTE:** Se você tem múltiplas aplicações no Dokploy:
   - **Build Method**: `Docker`
   - **Dockerfile Path**: `./Dockerfile.nextjs-style` ⭐
   - **Port**: `3000` ⭐ (compatível com seu projeto Next.js)
   - **Health Check Path**: `/health`

   **Para única aplicação:**
   - **Dockerfile Path**: `./Dockerfile.simple`
   - **Port**: `80`

4. **Environment Variables (opcional):**
   ```
   NODE_ENV=production
   BASE_URL=https://your-domain.com
   ```

5. **Deploy:**
   - Clique em "Deploy"
   - Aguarde o build e deploy (cerca de 2-3 minutos)

### 🔍 Verificação do Deploy

Após o deploy, você pode verificar:

- ✅ **Health Check**: `https://your-domain.com/health`
- ✅ **Página Principal**: `https://your-domain.com`
- ✅ **SPA Routing**: Navegação por âncoras funciona corretamente

### 🏗️ Arquitetura do Container

```
📦 Multi-stage Build
├── Builder Stage (Node.js)
│   ├── Instala dependências
│   ├── Build da aplicação Astro
│   └── Gera arquivos estáticos
└── Production Stage (Nginx)
    ├── Serve arquivos estáticos
    ├── SPA fallback configurado
    └── Gzip compression habilitado
```

### ⚡ Otimizações Implementadas

- **Multi-stage build** para imagem menor
- **Nginx otimizado** para SPAs
- **Gzip compression** automático
- **Cache headers** para assets estáticos
- **Security headers** configurados
- **Health check** endpoint (`/health`)

### 🐛 Troubleshooting

**Build falhando:**
- Verifique se todas as dependências estão no `package.json`
- Certifique-se que o `Dockerfile` está na raiz do projeto

**SPA routing não funciona:**
- O nginx está configurado para fallback para `index.html`
- Verifique se as rotas não incluem arquivos reais

**Performance issues:**
- A aplicação é servida por nginx (muito rápido)
- Assets são cacheados por 1 ano
- Gzip está habilitado

**Bad Gateway (502) Error:**
- Use `Dockerfile.simple` ao invés do `Dockerfile` padrão
- Certifique-se que a porta está configurada como `80`
- Verifique se o health check `/health` está respondendo
- Tente rebuild forçado no Dokploy

**Container não inicia:**
- Verifique os logs da aplicação no Dokploy
- Certifique-se que o build está completando com sucesso
- Teste localmente: `docker build -f Dockerfile.simple -t test . && docker run -p 8080:80 test`

### 🌐 Desenvolvimento Local com Docker

Para testar localmente antes do deploy:

```bash
# Build e run com docker-compose
docker-compose up --build

# Ou apenas com Docker
docker build -t nexsys-site .
docker run -p 8080:80 nexsys-site
```

Acesse: `http://localhost:8080`

## ✅ Status da Compatibilidade com Dokploy

| Recurso | Status | Descrição |
|---------|--------|-----------|
| **Docker Build** | ✅ | Multi-stage build otimizado |
| **Static Output** | ✅ | Astro configurado para output estático |
| **SPA Routing** | ✅ | Nginx fallback configurado |
| **Health Check** | ✅ | Endpoint `/health` implementado |
| **Security Headers** | ✅ | Headers de segurança configurados |
| **Gzip Compression** | ✅ | Compressão automática habilitada |
| **Asset Caching** | ✅ | Cache otimizado para assets |

### 🎯 Próximos Passos no Dokploy

1. **Push para Git**: `git push origin main`
2. **Deploy**: Configure no Dokploy Dashboard
3. **Domain**: Configure domínio personalizado
4. **SSL**: Certificado automático via Dokploy
5. **Monitoramento**: Use built-in monitoring do Dokploy

### 📊 Performance Esperada

- **Build Time**: ~2-3 minutos
- **Image Size**: ~60MB (otimizado)
- **Load Time**: <1 segundo (nginx + cache)
- **SEO Score**: 95+ (Lighthouse)

**🚀 O projeto está 100% pronto para deploy no Dokploy!**

## 🚀 Tecnologias Utilizadas

- **Framework**: [Astro](https://astro.build/) - Framework web moderno para sites rápidos
- **React**: Componentes interativos
- **Tailwind CSS**: Estilização utilitária e responsiva
- **TypeScript**: Tipagem estática para melhor desenvolvimento

## ✨ Características

- **Design Moderno**: Interface limpa e profissional
- **Totalmente Responsivo**: Otimizado para desktop, tablet e mobile
- **SPA-like**: Navegação suave entre seções
- **SEO Otimizado**: Meta tags, dados estruturados e performance
- **Acessibilidade**: Navegação por teclado e leitores de tela
- **Performance**: Carregamento rápido e otimizado

## 📁 Estrutura do Projeto

```text
/
├── public/
│   └── favicon.svg
├── src/
│   ├── components/
│   │   ├── Header.tsx          # Navegação principal
│   │   ├── HeroSection.tsx     # Seção principal
│   │   ├── AboutSection.tsx    # Sobre a empresa
│   │   ├── ServicesSection.tsx # Serviços oferecidos
│   │   ├── TeamSection.tsx     # Equipe
│   │   ├── ContactSection.tsx  # Formulário de contato
│   │   ├── Footer.tsx          # Rodapé
│   │   └── StructuredData.astro # SEO estruturado
│   ├── layouts/
│   │   └── MainLayout.astro    # Layout principal
│   ├── pages/
│   │   └── index.astro         # Página inicial
│   └── styles/
│       └── global.css          # Estilos globais
├── astro.config.mjs            # Configuração Astro
├── tailwind.config.mjs         # Configuração Tailwind
└── package.json
```

## 🛠️ Comandos Disponíveis

| Comando                   | Descrição                                      |
| :------------------------ | :--------------------------------------------- |
| `npm install`             | Instala as dependências                        |
| `npm run dev`             | Inicia servidor de desenvolvimento             |
| `npm run build`           | Gera build de produção                        |
| `npm run preview`         | Visualiza build localmente                    |
| `npm run astro check`     | Verifica tipos e erros                        |

## 🎨 Personalização

### Cores
O projeto utiliza um sistema de cores baseado no Tailwind CSS:
- **Primária**: Azul (#3B82F6)
- **Secundária**: Cinza (#6B7280)
- **Acentos**: Verde, Roxo, Amarelo

### Tipografia
- **Fonte principal**: Inter (Google Fonts)
- **Pesos**: 300, 400, 500, 600, 700

## 📱 Seções do Site

1. **Hero**: Apresentação principal com CTA
2. **Sobre**: Missão, valores e diferenciais
3. **Serviços**: Catálogo de serviços oferecidos
4. **Equipe**: Perfil dos profissionais
5. **Contato**: Formulário e informações de contato

## 🔍 SEO e Performance

- Meta tags otimizadas
- Dados estruturados (JSON-LD)
- Open Graph para redes sociais
- Twitter Cards
- Imagens otimizadas
- Carregamento lazy de componentes

## 🚀 Deploy

O projeto está configurado para deploy estático. Compatível com:
- Vercel
- Netlify
- GitHub Pages
- AWS S3 + CloudFront

## 📄 Licença

Este projeto foi desenvolvido exclusivamente para a empresa Nexsys.

## 👥 Contato

Para dúvidas ou sugestões:
- **E-mail**: contato@nexsys.com.br
- **Telefone**: (11) 9999-9999
- **Endereço**: São Paulo, SP
