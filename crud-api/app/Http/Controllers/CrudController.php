<?php
namespace App\Http\Controllers;

use App\Models\Article;
use Illuminate\Http\JsonResponse;
 use Illuminate\Http\Request;
 use Illuminate\Http\Response;

class CrudController extends Controller
{

    public function showAllArticle(): JsonResponse
    {

        return response()->json(Article::all());
    }

    public function showOneArticle($id): JsonResponse
    {

        return response()->json(Article::find($id));
    }

    public function create (Request $request)
    {

        $article = Article::create($request->all());

        return response()->json($article, Response::HTTP_CREATED);
    }

    public function update(Request $request)
    {
        $article = Article::find($request->id);
        $article->update($request->except('id'));
        return $article;

    }

    public function delete(Request $request)
    {
        $article = Article::find($request->id);
        $article->delete();
        return [
            'success' => true,
        ];

    }
}

// delete
        // $data = Article::find($request->id);

        // $data->delete();

        // return true;

// update
// $data = Article::find($request->id);

        // $data->update($request->except('id'));

        // return $data;

// create
// $data = Article::create([
        //     'title' => $request->title,
        //     'content' => $request->content
        // ]);

        // return $data;

// getAll
 // public function getAll()
    // {
    //     $data = Article::all();

    //     return $data;
    // }
