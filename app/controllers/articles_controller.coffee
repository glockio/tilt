class ArticlesController extends require('../extenders/_controller')
  model: 'Article'
  resource: "articles"
  routes:[
    {verb: 'get', url: "", action: "index"},
  ]

  index: (req, res, next) =>
    @model.find (err, articles) ->
      return next(err) if err
      res.render 'index',
        title: 'Generator-Express MVC By G'
        articles: articles

  update: (req, res, next) =>
    @model.find (err, articles) ->
      return next(err) if err
      res.render 'index',
        title: 'Generator-Express MVC Update'
        articles: articles

  create: (req, res, next) =>
    @model.find (err, articles) ->
      return next(err) if err
      res.render 'index',
        title: 'Generator-Express MVC By Create'
        articles: articles

  show: (req, res, next) =>
    @model.find (err, articles) ->
      return next(err) if err
      res.render 'index',
        title: 'Generator-Express MVC By SHow'
        articles: articles

  delete: (req, res, next) =>
    @model.find (err, articles) ->
      return next(err) if err
      res.render 'index',
        title: 'Generator-Express MVC By Delete'
        articles: articles


module.exports = (app) -> new ArticlesController app: app


