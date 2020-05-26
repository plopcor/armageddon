<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class APIController extends Controller
{
    /**
     * Return OK response
     */
    public function sendOk()
    {
        $response = [
            'success' => true
        ];

        return response()->json($response, 200);
    }


    /**
     * Return OK response with message
     *
     * @return \Illuminate\Http\Response
     */
    public function sendMessage($message)
    {
        $response = [
            'success' => true,
            'message'    => $message,
        ];

        return response()->json($response, 200);
    }

    /**
     * Return Correct response
     *
     * @return \Illuminate\Http\Response
     */
    public function sendResponse($result)
    {
        $response = [
            'success' => true,
            'data'    => $result,
        ];

        return response()->json($response, 200);
    }

    /**
     * Return Correct response
     *
     * @return \Illuminate\Http\Response
     */
    public function sendResponseMessage($result, $message)
    {
        $response = [
            'success' => true,
            'data'    => $result,
            'message' => $message,
        ];

        return response()->json($response, 200);
    }



    /**
     * Return Error
     */
    public function sendFailed()
    {
        $response = [
            'success' => true
        ];

        return response()->json($response, 200);
    }

    /**
     * Return Error response with message
     *
     * @return \Illuminate\Http\Response
     */
//    public function sendError($error, $errorMessages = [], $code = 404)
    public function sendError($code, $error = "Error", $errorMessages = [])
    {
        $response = [
            'success' => false,
            'message' => $error,
        ];

        if(!empty($errorMessages)){
            $response['data'] = $errorMessages;
        }

        return response()->json($response, $code);
    }

    /**
     * Return 400 Bad Request error response
     *
     * @return \Illuminate\Http\Response
     */
    public function sendErrorBadRequest($errors)
    {
        return $this->sendError(400, 'Datos incorrectos', $errors);
    }

    /**
     * Return 404 Not Found error response
     */
    public function sendErrorNotFound($message = 'No se ha encontrado el recurso')
    {
        return $this->sendError(404, $message);
    }

}
