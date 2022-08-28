import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:wantermarket/config/app_colors.dart';
import 'package:wantermarket/data/models/body/subCategory.dart';
import 'package:wantermarket/providers/auth_provider.dart';
import 'package:wantermarket/providers/category_detail_provider.dart';
import 'package:wantermarket/providers/crud_product_provider.dart';
import 'package:wantermarket/providers/vendor_provider.dart';
import 'package:wantermarket/shared/app_helper.dart';

import '../../../../config/app_dimenssions.dart';
import '../../../../data/models/body/category.dart';
import '../../../../data/models/body/product.dart';
import '../../../../data/models/body/product_crud_model.dart';
import '../../../../providers/category_provider.dart';

class ProductAddForm extends StatefulWidget {
  final Product? product;
  const ProductAddForm({Key? key,  this.product}) : super(key: key);

  @override
  State<ProductAddForm> createState() => _ProductAddFormState();
}

class _ProductAddFormState extends State<ProductAddForm> {

  FocusNode? _nameNode, _priceNode, _priceBeforeNode, _descriptionNode, _categoryNode, _subCategoryNode;

  File? image;
  File? image_level_2;
  File? image_level_3;
  List<Category> _categories = [];
  Category? _selectedCategory;

  List<SousCategorie> _subCategories = [];
  SousCategorie? _selectedSubCategory;
  final _nomProductController = TextEditingController();
  final _descriptionProductController = TextEditingController();
  final _priceProductController = TextEditingController();
  final _priceBeforeProductController = TextEditingController();


  @override
  void initState() {
    super.initState();

    _nameNode = FocusNode();
    _priceNode = FocusNode();
    _priceBeforeNode = FocusNode();
    _descriptionNode = FocusNode();
    _categoryNode = FocusNode();
    _subCategoryNode = FocusNode();
    _categories = Provider.of<CategoryProvider>(context, listen: false).categories;
    if(widget.product?.categorie != null){
      _selectedCategory = _categories.firstWhere((element) => element.id == widget.product?.categorie?.id);
    }else{
      _selectedCategory = _categories.first;
    }
    _nomProductController.text = widget.product?.name ?? '';
    _descriptionProductController.text = widget.product?.descriptionBrief ?? '';
    _priceProductController.text = widget.product?.price?.toString() ?? '';
    _priceBeforeProductController.text = widget.product?.priceBefore?.toString() ?? '' ;
    Provider.of<CategoryProviderDetails>(context, listen: false).getSubCategoriesOfCategory(_selectedCategory!.id!).then((value){
      setState(() {
        _subCategories = Provider.of<CategoryProviderDetails>(context, listen: false).souscategories;
        if(widget.product?.categorie != null){
          _selectedSubCategory = _subCategories.firstWhere((element) => element.id == widget.product?.sousCategorie?.id);
        }else{
          _selectedSubCategory = _subCategories.first;
        }
      });
    });



  }


  @override
  dispose() {
    _nomProductController.dispose();
    _descriptionProductController.dispose();
    _priceProductController.dispose();
    _priceBeforeProductController.dispose();
    _nameNode!.dispose();
    _priceNode!.dispose();
    _priceBeforeNode!.dispose();
    _descriptionNode!.dispose();
    _categoryNode!.dispose();
    _subCategoryNode!.dispose();
    super.dispose();
  }

  Future pickImage({ImageSource imageSource = ImageSource.gallery}) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource, imageQuality: 100, );
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageLevel2({ImageSource imageSource = ImageSource.gallery}) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource, imageQuality: 100, );
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => image_level_2 = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageLevel3({ImageSource imageSource = ImageSource.gallery}) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource, imageQuality: 100, );
      if(image == null) return;
      final imageTemp = File(image.path);
      setState(() => image_level_3 = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }


  clearForm(){
    _nomProductController.clear();
    _descriptionProductController.clear();
    _priceProductController.clear();
    _priceBeforeProductController.clear();
    setState(() {
      image = null;
      image_level_2 = null;
      image_level_3 = null;
    });
  }

   addProduct(ProductCrudModel productCrudModel, File image, File? imageLevel2, File? imageLevel3)   {
     Provider.of<CrudProductProvider>(context, listen: false).addProduct(productCrudModel, image, imageLevel2, imageLevel2).then((value) => {
       Provider.of<VendorProvider>(context, listen: false).getVendorProducts(),
       Provider.of<AuthProvider>(context, listen: false).verifyIsAuthenticated(),
       AppHelper.showInfoFlushBar(context, 'Produit ajouté avec succès'),
       clearForm()
     }).catchError((error){
       AppHelper.showInfoFlushBar(context, error.toString(), color: Colors.red);
     });
  }
   upDateProduct(int id, ProductCrudModel productCrudModel, File? image, File? imageLevel2, File? imageLevel3)   {
    Provider.of<CrudProductProvider>(context, listen: false).updateProduct( id, productCrudModel, image, imageLevel2, imageLevel2).then((value) => {
      Provider.of<VendorProvider>(context, listen: false).getVendorProducts(),
      Provider.of<AuthProvider>(context, listen: false).verifyIsAuthenticated(),
      AppHelper.showInfoFlushBar(context, 'Produit modifié avec succès'),
      clearForm()

    }).catchError((error){
      AppHelper.showInfoFlushBar(context, error.toString(), color: Colors.red);
    });
  }


  var key = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Form(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //image
            const SizedBox(height: 15,),
            const Text('Image Principale', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE),),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              height: MediaQuery.of(context).size.width*0.7,
              width: MediaQuery.of(context).size.width*0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: Colors.grey[200],
                image: image != null ? DecorationImage(image: FileImage(image!), fit: BoxFit.cover) :
                (  (widget.product != null && widget.product!.images!.isNotEmpty) ?
                DecorationImage(image: NetworkImage(widget.product!.images![0].path), fit: BoxFit.cover) : null),
                ),
              child: IconButton(
                icon:  Icon(Icons.add_a_photo, color: image == null ?  Colors.black : Colors.grey[300],size: 70,),
                onPressed: (){
                    pickCoverImage(context, pickImage);
                  },
              ),
            ),
            //list images
            const SizedBox(height: 15,),
             const Text('Images Secondaires', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE),),
              SizedBox(
              height: 210,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: MediaQuery.of(context).size.width*0.7,
                    width: MediaQuery.of(context).size.width*0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.grey[200],
                      image: image_level_2 != null ? DecorationImage(image: FileImage(image_level_2!), fit: BoxFit.cover) :
                      (  widget.product?.images?.length.compareTo(1)==1 ?
                      DecorationImage(image: NetworkImage(widget.product!.images![1].path), fit: BoxFit.cover) : null),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add_a_photo, color: Colors.black,size: 100,),
                      onPressed: (){
                        pickCoverImage(context,pickImageLevel2 );
                      },
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    height: MediaQuery.of(context).size.width*0.7,
                    width: MediaQuery.of(context).size.width*0.6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      color: Colors.grey[200],
                      image: image_level_3 != null ? DecorationImage(image: FileImage(image_level_3!), fit: BoxFit.cover) :
                      (  widget.product?.images?.length.compareTo(2)==1 ?
                      DecorationImage(image: NetworkImage(widget.product!.images![2].path), fit: BoxFit.cover) : null),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add_a_photo, color: Colors.black,size: 100,),
                      onPressed: (){
                        pickCoverImage(context,pickImageLevel3);
                      },
                    ),
                  ),


                ],
              ) ),
            const SizedBox(height: 15,),

             _ProductNameWidget(),
            //price
             _ProductPriceWidget(),
            //prix promotionnel
             _ProductPriceBeforeWidget(),
            //description
             _ProductDescriptionWidget(),
            //
            _CategoryProductWidget(),
            _SubCategoryProductWidget(),

            //submit button
            const SizedBox(height: 15,),
            Provider.of<CrudProductProvider>(context, listen: true).isLoading ?const Center(child: CircularProgressIndicator()) :
            ElevatedButton(
              child : SizedBox(height: 45, width: double.infinity, child:
              Center(child: Text(widget.product == null ? 'Ajouter Le produit' : 'Envoyer les modifications',
                style: const TextStyle(fontSize: AppDimensions.FONT_SIZE_LARGE, fontWeight: FontWeight.bold),),),),
              onPressed: () {
                if (key.currentState!.validate()) {
                  key.currentState?.save();

                  ProductCrudModel productCrudModel = ProductCrudModel(
                    disponibility: 'oui',
                    price: int.parse(_priceProductController.text),
                    priceBefore: _priceBeforeProductController.text.isNotEmpty ?int.parse(_priceBeforeProductController.text):0,
                    name: _nomProductController.text,
                    descriptionBrief: _descriptionProductController.text,
                    idCategory: _selectedSubCategory!.id!,
                  );
                  if(widget.product ==null)
                  {
                    if(image == null) {
                      showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                          title: Text('Erreur'),
                          content: Text('Veuillez ajouter une image pricipale'),
                        ),
                      );
                    }else{
                      addProduct(productCrudModel, image!, image_level_2, image_level_3);
                    }
                  }else{
                    upDateProduct(widget.product!.id!, productCrudModel, image, image_level_2, image_level_3);
                  }


                  }
                },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColors.PRIMARY),),

            ),

          ],
        ));
  }

  Future<dynamic> pickCoverImage(BuildContext context, Function onImagePicked) {
    return showDialog(
                    context: context,
                    builder: (context) =>  AlertDialog(
                      content: SizedBox(
                        height: 200,
                        width: double.infinity*0.9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15,),
                            const Text('Veuillez choisir une source', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE),),
                            const SizedBox(height: 15,),
                            TextButton(
                              onPressed: (){
                                onImagePicked();
                                Navigator.of(context).pop();
                              },
                              child: const Text('Via Gallery', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE),),
                            ),
                            const SizedBox(height: 15,),
                            TextButton(
                              onPressed: (){
                                onImagePicked(imageSource: ImageSource.camera);
                                Navigator.of(context).pop();
                              },
                              child: const Text('Via Appareil Photo', style: TextStyle(fontSize: AppDimensions.FONT_SIZE_EXTRA_LARGE),),
                            ),

                          ],
                        ),
                      ),
                    ),
                  );
  }



  Widget _ProductDescriptionWidget()  {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        focusNode: _descriptionNode,
        onEditingComplete: (){
          _descriptionNode!.unfocus();
          FocusScope.of(context).requestFocus(_categoryNode);
        },
        textInputAction: TextInputAction.next,
        controller: _descriptionProductController,
        minLines: 3,
        maxLines: 8,
        decoration: const InputDecoration(
          labelText: "Description",
          hintText: "Description",
          alignLabelWithHint: true,
          border: OutlineInputBorder(),

        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Veuillez choisir une categorie";
          }
          return null;
        },
      ),
    );
  }
  Widget _ProductPriceBeforeWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        focusNode: _priceBeforeNode,
        onEditingComplete: (){
          _descriptionNode!.requestFocus();
        },
        textInputAction: TextInputAction.next,
        controller: _priceBeforeProductController,
        decoration: const InputDecoration(
          labelText: "Prix promotionnel",
          hintText: "Prix promotionnel",
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),

        ),
        keyboardType: TextInputType.number,

      ),
    );
  }
  Widget _ProductPriceWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        focusNode: _priceNode,
        onEditingComplete: (){
          _priceBeforeNode!.requestFocus();
        },
        textInputAction: TextInputAction.next,
        controller: _priceProductController,
        decoration: const InputDecoration(
          labelText: "Prix du produit",
          hintText: "Prix du produit",

          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),

        ),

        keyboardType: TextInputType.number,
        validator: (value) {
          if (value!.isEmpty) {
            return "Veuillez entrer un prix de produit";
          }
          return null;
        },
      ),
    );
  }
  Widget _ProductNameWidget(){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        focusNode: _nameNode,
        onEditingComplete: (){
          _priceNode!.requestFocus();
        },
        controller: _nomProductController,
        decoration: const InputDecoration(
          labelText: "Nom du produit",
          hintText: "Nom du produit",
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "Veuillez entrer un nom de produit";
          }
          return null;
        },
      ),
    );
  }
  Widget _CategoryProductWidget(){
    return DropdownButtonHideUnderline(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: DropdownButton2(
          focusNode: _categoryNode,
          isExpanded: true,
          hint: Row(
            children: const [
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  'Selectionner une categorie',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: _categories
              .map((item) => DropdownMenuItem<Category>(
            value: item,
            child: Text(
              item.name!,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ))
              .toList(),
          value:   _selectedCategory,
          onChanged: (value) {
            setState(() {
              _selectedCategory = value as Category;
              Provider.of<CategoryProviderDetails>(context, listen: false).getSubCategoriesOfCategoryDp(value.id!, _subCategories).then((value) => setState(() {
                 if(value.isEmpty){
                  _subCategories.add(SousCategorie(id: 0, name: "Pas de Sous categorie",imagePath: ""));
                  _categories.add(Category(id: 0, name: "Pas de categorie",imagePath: ""));
                }else{
                  _subCategories = value;
                   _selectedSubCategory = _subCategories.first;
                 }

               }));
            });
          },
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor:AppColors.PRIMARY,
          iconDisabledColor: AppColors.PRIMARY,
          buttonHeight: 50,
          buttonWidth: 160,
          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            border: Border.all(
              color: Colors.black45,
            ),
            color: Colors.white,
          ),
          buttonElevation: 0,
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 300,
          dropdownWidth: 200,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.white,
          ),
          dropdownElevation: 0,
          scrollbarRadius: const Radius.circular(0),
          scrollbarThickness: 8,
          scrollbarAlwaysShow: true,
          offset: const Offset(10, 300),
        ),
      ),
    );
  }
  Widget _SubCategoryProductWidget(){
    return DropdownButtonHideUnderline(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(top: 10),
        child: DropdownButton2(
          focusNode: _subCategoryNode,
          isExpanded: true,
          hint: Row(
            children: const [
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Text(
                  'Selectionner une sous categoriee',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: _subCategories
              .map((item) => DropdownMenuItem<SousCategorie>(
            value: item,
            child: Text(
              item.name!,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ))
              .toList(),
          value: _selectedSubCategory,
          onChanged: (value) {
            setState(() {
              _selectedSubCategory = value as SousCategorie;
            });
          },
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
          ),
          iconSize: 14,
          iconEnabledColor: Colors.black,
          iconDisabledColor: Colors.black,
          buttonHeight: 50,
          buttonWidth: 160,
          buttonPadding: const EdgeInsets.only(left: 14, right: 14),
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            border: Border.all(
              color: Colors.black26,
            ),
            color: Colors.white,
          ),
          buttonElevation: 0,
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 14, right: 14),
          dropdownMaxHeight: 200,
          dropdownWidth: 300,
          dropdownPadding: null,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(0),
            color: Colors.white,
          ),
          dropdownElevation: 8,
          scrollbarRadius: const Radius.circular(0),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          offset: const Offset(0, 300),
        ),
      ),
    );
  }
}



