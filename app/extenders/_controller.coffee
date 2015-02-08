class AppController
  url_root: "/"

  restful_routes: -> [
    {verb: 'get', url: "#{@resource}", action: "index"},
    {verb: 'get', url: "#{@resource}/:id", action: "show"},
    {verb: 'put', url: "#{@resource}/:id}", action: "update"},
    {verb: 'post', url: "#{@resource}", action: "create"},
    {verb: 'delete', url: "#{@resource}/:id", action: "delete"},
  ]

  constructor: (options={}) ->
    @app = options.app
    @express  = require 'express'
    @mongoose = require 'mongoose'

    @_config_routes(options)

    @model  = @mongoose.model(@model) if @model

    @init(options) if @init


  _config_routes:(options)  ->
    @router = options.router ||= @express.Router()

    @app.use @url_root, @router

    @_create_restful_routes() if @resource

    _(@routes).each (route) =>
      @_add_route route


  _create_restful_routes: ->
    _(@restful_routes()).each (route) =>
      @_add_route route

  _add_route: (route) ->
    url = @url_root + route.url
    @router[route.verb] url, @[route.action]



_ = require 'underscore-node'
module.exports = AppController