import 'package:flutter/material.dart';
import 'package:marier_shoping/base_page.dart';
import 'package:marier_shoping/bottom_nav/category/items/category_list_item.dart';
import 'package:marier_shoping/custom_widgets/text_widget.dart';

class CategoryListPage extends BasePage {
  CategoryListPage(this.title);

  final String title;

  @override
  _CategoryListPageState createState() => _CategoryListPageState(title);
}

List<CategoryListItem> woman = [
  CategoryListItem(
    url: [
      "https://images.unsplash.com/photo-1577525179375-b870f894a365?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1557760697-63ea4de75a7e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1502716119720-b23a93e5fe1b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1478146896981-b80fe463b330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1499939667766-4afceb292d05?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    ],
    title: "New Arrivals",
  ),
  CategoryListItem(
    url: [
      "https://images.unsplash.com/photo-1557760697-63ea4de75a7e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1478146896981-b80fe463b330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1502716119720-b23a93e5fe1b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1577525179375-b870f894a365?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1499939667766-4afceb292d05?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    ],
    title: "Dresses",
  ),
  CategoryListItem(
    url: [
      "https://images.unsplash.com/photo-1502716119720-b23a93e5fe1b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1557760697-63ea4de75a7e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1577525179375-b870f894a365?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1499939667766-4afceb292d05?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1478146896981-b80fe463b330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    ],
    title: "Shirt & Blouses",
  ),
  CategoryListItem(
    url: [
      "https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1557760697-63ea4de75a7e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1478146896981-b80fe463b330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1577525179375-b870f894a365?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1499939667766-4afceb292d05?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1502716119720-b23a93e5fe1b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    ],
    title: "Jeans",
  ),
  CategoryListItem(
    url: [
      "https://images.unsplash.com/photo-1478146896981-b80fe463b330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1499939667766-4afceb292d05?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1557760697-63ea4de75a7e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1502716119720-b23a93e5fe1b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1577525179375-b870f894a365?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    ],
    title: "Clearance",
  ),
  CategoryListItem(
    url: [
      "https://images.unsplash.com/photo-1478146896981-b80fe463b330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1557760697-63ea4de75a7e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1499939667766-4afceb292d05?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1502716119720-b23a93e5fe1b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1577525179375-b870f894a365?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    ],
    title: "Sale",
  ),
];

List<CategoryListItem> man = [
  CategoryListItem(
    url: [
      "https://images.unsplash.com/photo-1514407151397-0d5b926e3617?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1520367745676-56196632073f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1551180451-11dba6c1c29b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1610652492500-ded49ceeb378?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1512437011370-3c5a37a2190f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1520975954732-35dd22299614?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    ],
    title: "New Arrivals",
  ),
  CategoryListItem(
    url: [
      "https://images.unsplash.com/photo-1512437011370-3c5a37a2190f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1520975954732-35dd22299614?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1520367745676-56196632073f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1551180451-11dba6c1c29b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1610652492500-ded49ceeb378?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1514407151397-0d5b926e3617?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    ],
    title: "Dresses",
  ),
  CategoryListItem(
    url: [
      "https://images.unsplash.com/photo-1551180451-11dba6c1c29b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1610652492500-ded49ceeb378?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1520975954732-35dd22299614?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1520367745676-56196632073f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1514407151397-0d5b926e3617?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1512437011370-3c5a37a2190f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    ],
    title: "Shirt",
  ),
  CategoryListItem(
    url: [
      "https://images.unsplash.com/photo-1512437011370-3c5a37a2190f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1520367745676-56196632073f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1514407151397-0d5b926e3617?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1610652492500-ded49ceeb378?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1551180451-11dba6c1c29b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1520975954732-35dd22299614?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    ],
    title: "Jeans",
  ),
  CategoryListItem(
    url: [
      "https://images.unsplash.com/photo-1520975954732-35dd22299614?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1610652492500-ded49ceeb378?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1514407151397-0d5b926e3617?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1551180451-11dba6c1c29b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1512437011370-3c5a37a2190f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1520367745676-56196632073f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    ],
    title: "Clearance",
  ),
  CategoryListItem(
    url: [
      "https://images.unsplash.com/photo-1520367745676-56196632073f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1512437011370-3c5a37a2190f?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1610652492500-ded49ceeb378?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1514407151397-0d5b926e3617?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1520975954732-35dd22299614?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1551180451-11dba6c1c29b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    ],
    title: "Sale",
  ),
];

List<CategoryListItem> kids = [
  CategoryListItem(
    url: [
      "https://images.unsplash.com/photo-1514407151397-0d5b926e3617?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1577525179375-b870f894a365?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1610652492500-ded49ceeb378?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1551180451-11dba6c1c29b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1557760697-63ea4de75a7e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    ],
    title: "New Arrivals",
  ),
  CategoryListItem(
    url: [
      "https://images.unsplash.com/photo-1514407151397-0d5b926e3617?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1557760697-63ea4de75a7e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1610652492500-ded49ceeb378?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1577525179375-b870f894a365?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1551180451-11dba6c1c29b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    ],
    title: "Dresses",
  ),
  CategoryListItem(
    url: [
      "https://images.unsplash.com/photo-1577525179375-b870f894a365?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1514407151397-0d5b926e3617?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1610652492500-ded49ceeb378?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1551180451-11dba6c1c29b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1557760697-63ea4de75a7e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    ],
    title: "Shirt",
  ),
  CategoryListItem(
    url: [
      "https://images.unsplash.com/photo-1551180451-11dba6c1c29b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1514407151397-0d5b926e3617?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1610652492500-ded49ceeb378?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1577525179375-b870f894a365?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1557760697-63ea4de75a7e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    ],
    title: "Jeans",
  ),
  CategoryListItem(
    url: [
      "https://images.unsplash.com/photo-1610652492500-ded49ceeb378?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1514407151397-0d5b926e3617?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1551180451-11dba6c1c29b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1577525179375-b870f894a365?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1557760697-63ea4de75a7e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    ],
    title: "Clearance",
  ),
  CategoryListItem(
    url: [
      "https://images.unsplash.com/photo-1610652492500-ded49ceeb378?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1577525179375-b870f894a365?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1514407151397-0d5b926e3617?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1557760697-63ea4de75a7e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
      "https://images.unsplash.com/photo-1551180451-11dba6c1c29b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=300&q=80",
    ],
    title: "Sale",
  ),
];

final list = {"WOMAN": woman, "MAN": man, "KIDS": kids};

class _CategoryListPageState extends BasePageState<CategoryListPage> with BasicPage {
  _CategoryListPageState(this.title);

  final String title;

  @override
  Widget body() {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBarBack(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextWidget(title, weight: FontWeight.w600, size: 20.0, padding: const EdgeInsets.only(top: 8.0, left: 24.0)),
            ListView.builder(
              itemCount: list[title].length,
              itemBuilder: (_, index) => list[title][index],
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}
