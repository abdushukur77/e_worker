import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_worker/data/model/category/category_model.dart';
import '../../utils/constants/app_constants.dart';
import '../model/category/sub_category_model.dart';
import '../model/network_response.dart';

class CategoriesRepository {
  Future<NetworkResponse> getSubCategories(String parentId) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(AppConstants.subCategories)
          .where("parentId", isEqualTo: parentId)
          .get();
      List<SubCategoryModel> subCategories = querySnapshot.docs
          .map((e) =>
              SubCategoryModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();

      return NetworkResponse(data: subCategories);
    }catch (error) {
      return NetworkResponse(errorCode: error.toString());
    }
  }

  Future<NetworkResponse> getCategoriesByCategoryId(String categoryId) async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection(AppConstants.categories)
          .doc(categoryId)
          .get();

      if (documentSnapshot.exists) {
        CategoryModel category = CategoryModel.fromJson(
            documentSnapshot.data() as Map<String, dynamic>);
        return NetworkResponse(data: category);
      } else {
        return NetworkResponse(errorText: 'Kategoriya topilmadi');
      }
    }
    catch (error) {
      return NetworkResponse(errorCode: error.toString());
    }
  }

  Future<NetworkResponse> getAllCategories() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(AppConstants.categories)
          .get();

      List<CategoryModel> categories = querySnapshot.docs
          .map((e) => CategoryModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();

      return NetworkResponse(data: categories);
    }catch (error) {
      return NetworkResponse(errorCode: error.toString());
    }
  }
}
// List<CategoryModel> category=[
//   CategoryModel(id: "1", name:"Profissionlar ishchilar"),
//   CategoryModel(id: "2", name:"Kunlik ishchilar"),
//   CategoryModel(id: "3", name:"Qurilish materiallari"),
// ];
//
// List<SubCategoryModel> subCategories=[
//   SubCategoryModel(id:"1", name:"usta", parentId:"1"),
//   SubCategoryModel(id:"2", name:"adfsa", parentId: "1"),
//   SubCategoryModel(id:"3", name:"shafsd", parentId: "2"),
//   SubCategoryModel(id:"4", name:"asdfasjhf", parentId: "2"),
//   SubCategoryModel(id:"5", name:"fasdf", parentId: "3"),
//   SubCategoryModel(id:"6", name:"fasdfas", parentId: "3"),
// ];
