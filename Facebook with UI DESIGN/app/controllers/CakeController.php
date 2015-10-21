<?php

class CakeController extends BaseController {

	//DISPLAY OF THE CAKES  
    public function order($id){
      
       $orderCake = Cake::find($id);
       $buyer = Buyer::orderBy('created_at', 'desc')->first();
       $fbID = $buyer->fbID;
       $select = Cake::where('id', '=', $id)->get(); 
       $order = new Order;

        $name = $select['name'];
        $price = $select['price'];
        $category = $select['category'];
        $description = $select['description'];
        $fbID = $fbID;
        $image=$select['image'];

        $order->name=$name;
        $order->price=$price;
        $order->category=$category;
        $order->description=$description;
        $order->buyersID=$fbID;
        $order->image=$image;

        $order->save();

       return Redirect::to('myaccountBuyer'); 

    }
    
	
  public function addCake()
  { 
       $user = User::where('fbId','=',$_SESSION['userFbID'])->get();
       return View::make('addCake')->with('user',$user);
      //return "aw";
  }  

	public function saveCake()
	{
	    // validate
        $rules = array(
            'name'    => 'required',
            'price'   => 'required',
            'category' => 'required',
            'description'   => 'required', 
        );
        $validator = Validator::make(Input::all(), $rules);

        // process the login
        if ($validator->fails()) {
            return Redirect::to('addCake')
                ->withErrors($validator);
        } else {
        	//IMAGEUPLOAD
        	$image = Input::file('image');
			if($image) {
				$upload_folder = '/img/upload/';
				$file_name = str_random(30). '.' . $image->getClientOriginalExtension();
				$image->move(public_path() . $upload_folder, $file_name);
			}
			///

			// store
            $cake = new Cake;
            $cake->name = Input::get('name');
            $cake->price = Input::get('price');
            $cake->category = Input::get('category');
            $cake->description = Input::get('description');
            
            $seller = new Seller;

            $findUser = Seller::all();
            $findUser=$_SESSION['userFbID'];
            //$seller = Seller::orderBy('created_at', 'desc')->first();
            //$fbId = $seller['fbId'];
            $cake->userFbId = $findUser;

           
            //IMAGEUPLOAD
            if($image) $cake->image = $file_name;
            ///////
            $cake->save();

            // redirect
            Session::flash('message', 'Successfully created Product!');
            return Redirect::to('myaccountSeller');
        }
	}
  // public function addCakeBuyer()
  // {
  //      return View::make('addCakeBuyer');
  //     //return "aw";
  // }  

  // public function saveCakeBuyer()
  // {
  //     // validate
  //       $rules = array(
  //           'name'    => 'required',
  //           'price'   => 'required',
  //           'category' => 'required',
  //           'description'   => 'required', 
  //       );
  //       $validator = Validator::make(Input::all(), $rules);

  //       // process the login
  //       if ($validator->fails()) {
  //           return Redirect::to('addCake')
  //               ->withErrors($validator);
  //       } else {
  //         //IMAGEUPLOAD
  //         $image = Input::file('image');
  //     if($image) {
  //       $upload_folder = '/img/upload/';
  //       $file_name = str_random(30). '.' . $image->getClientOriginalExtension();
  //       $image->move(public_path() . $upload_folder, $file_name);
  //     }
  //     ///

  //     // store
  //           $cake = new Cake;
  //           $cake->name = Input::get('name');
  //           $cake->price = Input::get('price');
  //           $cake->category = Input::get('category');
  //           $cake->description = Input::get('description');
            
  //           $buyer = new Buyer;

  //           $buyer = Buyer::orderBy('created_at', 'desc')->first();
  //           $fbId = $buyer['fbId'];
  //           $cake->userFbId = $fbId;

           
  //           //IMAGEUPLOAD
  //           if($image) $cake->image = $file_name;
  //           ///////
  //           $cake->save();

  //           // redirect
  //           Session::flash('message', 'Successfully created Product!');
  //           return Redirect::to('myaccountBuyer');
  //       }
  // }
    public function editCake($id)
    {
      $editCake = Cake::find($id); 
      return View::make('updateCake')->with('editCake', $editCake); 
    }

    public function updateCake()
    { 

       $inputDetails = Input::all();
         $rules = array(
            'name'    => 'required',
            'price'   => 'required',
            'category' => 'required',
            'description'   => 'required', 
        );
        $validation = Validator::make($inputDetails, $rules);
  

       if($validation->passes())  
       {
         $image = Input::file('image');
            if($image) {
                $upload_folder = '/img/upload/';
                $file_name = str_random(30). '.' . $image->getClientOriginalExtension();
                $image->move(public_path() . $upload_folder, $file_name);
            }
            
           
           $editCake = Cake::find($id);   

           $editCake->name = $inputDetails['name'];
           $editCake->price = $inputDetails['price'];
           $editCake->category = $inputDetails['category'];
           $editCake->description = $inputDetails['description'];

            if($image) $cake->image = $file_name;
           $editCake->save();


          return Redirect::to('myaccountSeller');
        }
      else
        return Redirect::back()->withInput()->withErrors($validation);
              
    }


    //CREATE MODEL CAKE
    public function createCake(){
      // return View::make('createCake');

    $user = User::where('fbId','=',$_SESSION['userFbID'])->get();
    $layers = layer::all();
    $return = cakeModel::all();
    $cake = new cakeModel;
    $cake->sellerID ='';
    $cake->buyerID =$_SESSION['userFbID'];
    $cake->name ='';
    $cake->price ='';
    $cake->category ='';
    $cake->description ='';
    $cake->availability ='';
    $cake->image ='';
    $cake->layer1 =0;
    $cake->layer2 =0;
    $cake->layer3 =0;
    $cake->layer1topper =0;
    $cake->layer2topper =0;
    $cake->layer3topper =0;
   
    $_SESSION['findLayers']='BaseLayer';

      if( $_SESSION['cakeModelID']==0)
      {  $cake->save();
        $_SESSION['cakeModelID'] = $cake->id;

      }

      $findCaketogenerateModel= cakeModel::find($_SESSION['cakeModelID']);
      //var_dump($findCaketogenerateModel);

      return View::make('createCake')
      ->with('layers', $layers)
      ->with('user',$user)
      ->with('findCaketogenerateModel',$findCaketogenerateModel);


    }


   public function addItemCakeModel(){
      // return View::make('createCake');
     $id = Input::get("id");
     $box = Input::get("box");

      $Layers= layer::find($id);

      $findCaketogenerateModel = cakeModel::find($_SESSION['cakeModelID']);
     

  if($Layers['BaseLayer']==1||$Layers['BaseLayer']>0){

      if($box=='layer1')
       { 
        $findCaketogenerateModel->layer1=$id;
        $findCaketogenerateModel->save();
         
       
       }
       elseif($box=='layer2')
       {
        $findCaketogenerateModel->layer2=$id;
        $findCaketogenerateModel->save();
       
       }
         elseif($box=='layer3')
       {
        $findCaketogenerateModel->layer3=$id;
        $findCaketogenerateModel->save();
        
       }
  } 
  elseif($Layers['Toppers']==1||$Layers['Toppers']>0){

      if($box=='layer1')
       { 
        $findCaketogenerateModel->layer1topper=$id;
        $findCaketogenerateModel->save();
     
  

       }
       elseif($box=='layer2')
       {
        $findCaketogenerateModel->layer2topper=$id;
        $findCaketogenerateModel->save();
      
    
       }
         elseif($box=='layer3')
       {
        $findCaketogenerateModel->layer3topper=$id;
        $findCaketogenerateModel->save();
        
      
       }
  } 

    // $findCaketogenerateModel= cakeModel::find($_SESSION['cakeModelID']);
    
 return Redirect::back()->with('findCaketogenerateModel',$findCaketogenerateModel);
/*->with('findCaketogenerateModel',$findCaketogenerateModel)*/;
    }

     public function findLayer(){
  
    $user = User::where('fbId','=',$_SESSION['userFbID'])->get();
    $layers = layer::all();
    $return = cakeModel::all();
    $cake = new cakeModel;
    $cake->sellerID ='';
    $cake->buyerID =$_SESSION['userFbID'];
    $cake->name ='';
    $cake->price ='';
    $cake->category ='';
    $cake->description ='';
    $cake->availability ='';
    $cake->image ='';
    $cake->layer1 =0;
    $cake->layer2 =0;
    $cake->layer3 =0;
    $cake->layer1topper =0;
    $cake->layer2topper =0;
    $cake->layer3topper =0;

   


      if( $_SESSION['cakeModelID']==0)
      {  $cake->save();
        $_SESSION['cakeModelID'] = $cake->id;

      }

      $findCaketogenerateModel= cakeModel::find($_SESSION['cakeModelID']);
      //var_dump($findCaketogenerateModel);
      $bool=0;
      $_SESSION['findLayers'] = Input::get('findLayer');
      if($_SESSION['findLayers']=='BaseLayer')
        {$bool=1;}
    
    return View::make('createCake')
    ->with('layers', $layers)
    ->with('user',$user)
    ->with('findCaketogenerateModel',$findCaketogenerateModel)
    ->with('bool',$bool);

}


   public function savePrintscreen(){
     $CakeModel = cakeModel::find($_SESSION['cakeModelID']);


      $image = Input::file('image');
            if($image) {
                $upload_folder = '/img/upload/';
                $file_name = str_random(30). '.' . $image->getClientOriginalExtension();
                $image->move(public_path() . $upload_folder, $file_name);
            }
   
    $CakeModel->image = $file_name;
    $CakeModel->save();
    return Redirect::back();
}



   public function fuck(){
return Input::get("test");
}

    
     
}

//save para layer2
/* $LAYER = new layer;
      $image = Input::file('image');
            if($image) {
                $upload_folder = '/img/upload/layers';
                $file_name = str_random(30). '.' . $image->getClientOriginalExtension();
                $image->move(public_path() . $upload_folder, $file_name);
            }
   
    $LAYER->image = $file_name;
    $LAYER->save();*/

?>