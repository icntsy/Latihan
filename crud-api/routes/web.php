<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

// get(read), post(create), put(update)
// $router->get('article', 'CrudController@getAll');
// $router->post('article', 'CrudController@create');
// $router->put('article', 'CrudController@update');
// $router->delete('article', 'CrudController@delete');

$router->group(['prefix' => 'api'], function () use ($router) {
    $router->get('article', ['uses' => 'CrudController@showAllArticle']);
    $router->get('article/{id}', ['uses' => 'CrudController@showOneArticle']);
    $router->post('article', ['uses' => 'CrudController@create']);
    $router->post('article/delete', ['uses' => 'CrudController@delete']);
    $router->put('article', ['uses' => 'CrudController@update']);
});
