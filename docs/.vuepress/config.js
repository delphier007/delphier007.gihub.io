module.exports = {
  locales: {
    //Importante para que todas las páginas sean en es-ES
    '/': {
      lang: "es-ES",
      title: "Knowledge DB",
      description: "Página de documentación propia sobre tecnologías de programación.",
    }
  },
  markdown: {
    lineNumbers: true
  },
  themeConfig: {
    logo: "/img/logo.png",
    displayAllHeaders: false,
    nav: [
      { text: "Home", link: "/" },
      { 
        text: "Guía",
        ariaLabel: "Menu documentación",
        items: [
          { text: "CSS", link: "/guia/css" },
          { text: "Git", link: "/guia/git" },
          { text: "Typescript", link: "/guia/typescript" },
        ]
      },
      { text: "Google", link: "https://google.es" }
      
    ],
    sidebarDepth: 2,
    sidebar: [
      '/',
      '/guia/',
      ['/guia/css','CSS'],
      ['/guia/git','GIT'],
      '/guia/typescript',
    ] 
  }
};
