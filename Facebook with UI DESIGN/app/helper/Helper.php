<?php

class Helper {
	public static function Display($layer,$findLayers){
        $Layers = Layer::all();
		$output = "";
        $cakeid=$_SESSION['cakeModelID'];
        //$layer-mao ni ang box nga gi buhat sa html
       // $category=$_SESSION['Category'];


        foreach($Layers as $layerss)
        {   
            if($layer=='choosebox')
            {       	if($findLayers=='BaseLayer' && $layerss['BaseLayer']==1){
             		$output .= "\t\t\t<div id='" . $layerss["id"] . "'>" . '<img src="'. URL::asset('img/upload/layers/'.$layerss['image']).'" height="100" width="100" /> ' .
                    "</div>\n";            	
                        }
                        elseif($findLayers=='Toppers' && $layerss['Toppers']==1){
                    $output .= "\t\t\t<div id='" . $layerss["id"] . "'>" . '<img src="'. URL::asset('img/upload/layers/'.$layerss['image']).'" height="100" width="100" /> ' .
                    "</div>\n";             
                        }
            }
              elseif($_SESSION['findLayers']=='BaseLayer')
                    {        //query ang cake model where kato gi session nako nga id sa cakemodel
                             $cakeModel = cakeModel::where('id','=',$cakeid)->get();
                            foreach($cakeModel as $model){
                                //gi query ang cake nya gi compare2 if unsai sud && gi tanaw unsa na box ang outputan
                                if($model['layer1']==$layerss["id"]&&$layer=='layer1'){

                                $output .= "\t\t\t<div id='" . $layerss["id"] . "'>" . '<img src="'. URL::asset('img/upload/layers/'.$layerss['image']).'" height="100" width="100" /> ' .
                                "</div>\n";
                                
                                }
                                elseif($model['layer2']==$layerss["id"]&&$layer=='layer2'){
                                $output .= "\t\t\t<div id='" . $layerss["id"] . "'>" . '<img src="'. URL::asset('img/upload/layers/'.$layerss['image']).'" height="100" width="100" /> ' .
                                "</div>\n";
                                } 
                                elseif($model['layer3']==$layerss["id"]&&$layer=='layer3'){
                                $output .= "\t\t\t<div id='" . $layerss["id"] . "'>" . '<img src="'. URL::asset('img/upload/layers/'.$layerss['image']).'" height="100" width="100" /> ' .
                                "</div>\n";
                                }  
                            }        

                    }
                    elseif($_SESSION['findLayers']=='Toppers')
                    {        //query ang cake model where kato gi session nako nga id sa cakemodel
                             $cakeModel = cakeModel::where('id','=',$cakeid)->get();
                            foreach($cakeModel as $model){
                                //gi query ang cake nya gi compare2 if unsai sud && gi tanaw unsa na box ang outputan
                                if($model['layer1topper']==$layerss["id"]&&$layer=='layer1'){

                                $output .= "\t\t\t<div id='" . $layerss["id"] . "'>" . '<img src="'. URL::asset('img/upload/layers/'.$layerss['image']).'" height="100" width="100" /> ' .
                                "</div>\n";
                                
                                }
                                elseif($model['layer2topper']==$layerss["id"]&&$layer=='layer2'){
                                $output .= "\t\t\t<div id='" . $layerss["id"] . "'>" . '<img src="'. URL::asset('img/upload/layers/'.$layerss['image']).'" height="100" width="100" /> ' .
                                "</div>\n";
                                } 
                                elseif($model['layer3topper']==$layerss["id"]&&$layer=='layer3'){
                                $output .= "\t\t\t<div id='" . $layerss["id"] . "'>" . '<img src="'. URL::asset('img/upload/layers/'.$layerss['image']).'" height="100" width="100" /> ' .
                                "</div>\n";
                                }  
                            }        

                    }

        }

        return $output;
	}

    public static function DisplayTopper($idtopper){
        $cakeid=$_SESSION['cakeModelID'];
    
        
   
        $Layer = Layer::where('id','=',$idtopper)->get();
       
    if($Layer!=NULL)
    {   foreach($Layer as $Layers)
        {}return $Layers['image'];
             }else return $idtopper;
 
       

    }
}