class PopularImages {
  const PopularImages({
    this.title,
    this.image,
  });
  final String? title;

  final String? image;
}

// ignore: unnecessary_const
const List<PopularImages> popularImages = const <PopularImages>[
  PopularImages(
    title: 'oraimo',
    image: "assets/images/a&b_stores.png",
  ),
  PopularImages(
    title: 'Samsung',
    image: "assets/images/a&b_stores.png",
  ),
  PopularImages(
    title: 'Oraimo',
    image: "assets/images/a&b_stores.png",
  ),
  PopularImages(
    title: 'A & B Stores',
    image: "assets/images/a&b_stores.png",
  ),
  PopularImages(
    title: 'Samsung',
    image: "assets/images/a&b_stores.png",
  ),
];

class PopularCategories {
  const PopularCategories({this.title, this.image});
  final String? title;

  final String? image;
}

// ignore: unnecessary_const
const List<PopularCategories> popularCategories = const <PopularCategories>[
  PopularCategories(
    title: 'Tech',
    image: "assets/images/a&b_stores.png",
  ),
  PopularCategories(
    title: 'Flowers',
    image: "assets/images/a&b_stores.png",
  ),
  PopularCategories(
    title: 'Fashion',
    image: "assets/images/a&b_stores.png",
  ),
  PopularCategories(
    title: 'Ssc-Fi',
    image: "assets/images/a&b_stores.png",
  ),
  PopularCategories(
    title: 'Abstract',
    image: "assets/images/a&b_stores.png",
  ),
];

class StoresLists {
  const StoresLists(
      {this.title,
      this.description,
      this.rating,
      this.price,
      this.storeName,
      this.image});
  final String? title;
  final String? price;
  final String? storeName;

  final String? description;
  final String? rating;
  final String? image;
}

// ignore: unnecessary_const
const List<StoresLists> storesLists = const <StoresLists>[
  StoresLists(
    storeName: "Maryland Mall",
    title: 'Tech',
    price: "from \$14.89",
    description:
        "Toptek stores specialize in top \nquality bluetooth technology ",
    image: "assets/images/image.png",
    rating: "7.0 (20)",
  ),
  StoresLists(
    title: 'Ssc-Fi',
    storeName: "Yaba Mall",
    rating: "7.0 (20)",
    image: "assets/images/watch.png",
    price: "from \$14.89",
    description:
        "Toptek stores specialize in top \nquality bluetooth technology ",
  ),
  StoresLists(
    title: 'Flowers',
    storeName: "TopTek Mall",
    price: "from \$14.89",
    description:
        "Toptek stores specialize in top \nquality bluetooth technology ",
    rating: "7.0 (20)",
    image: "assets/images/robot.png",
  ),
  StoresLists(
    storeName: "Pizza Mall",
    title: 'Abstract',
    rating: "7.0 (20)",
    image: "assets/images/image.png",
    price: "from \$14.89",
    description:
        "Toptek stores specialize in top \nquality bluetooth technology ",
  ),
  StoresLists(
    title: 'Fashion',
    storeName: "Tek Top Mall",
    rating: "7.0 (20)",
    image: "assets/images/watch.png",
    price: "from \$14.89",
    description:
        "Toptek stores specialize in top \nquality bluetooth technology ",
  ),
  StoresLists(
    title: 'Ssc-Fi',
    storeName: "Yaba Mall",
    rating: "7.0 (20)",
    image: "assets/images/robot.png",
    price: "from \$14.89",
    description:
        "Toptek stores specialize in top \nquality bluetooth technology ",
  ),
];

class StoresProductLists {
  const StoresProductLists(
      {this.description, this.rating, this.price, this.storeName, this.image});

  final String? price;
  final String? storeName;

  final String? description;
  final String? rating;
  final String? image;
}

// ignore: unnecessary_const
const List<StoresProductLists> storesProductLists = const <StoresProductLists>[
  StoresProductLists(
    storeName: "Airpod Pro 2017",
    price: "\$14.89",
    description:
        "Toptek stores specialize in top \nquality bluetooth technology ",
    image: "assets/images/sendovia_logo.png",
    rating: "7.0 (20)",
  ),
  StoresProductLists(
    storeName: "Airpod Pro IX",
    rating: "7.0 (20)",
    image: "assets/images/samsung.png",
    price: "\$14.89",
    description:
        "Toptek stores specialize in top \nquality bluetooth technology ",
  ),
  StoresProductLists(
    storeName: "Airpod Pro -",
    price: "\$14.89",
    description:
        "Toptek stores specialize in top \nquality bluetooth technology ",
    rating: "7.0 (20)",
    image: "assets/images/sendovia_logo.png",
  ),
  StoresProductLists(
    storeName: "Airpod Pro +",
    rating: "7.0 (20)",
    image: "assets/images/sendovia_logo.png",
    price: "\$14.89",
    description:
        "Toptek stores specialize in top \nquality bluetooth technology ",
  ),
  StoresProductLists(
    storeName: "Airpod Pro Pro",
    rating: "7.0 (20)",
    image: "assets/images/oraimo.png",
    price: "\$14.89",
    description:
        "Toptek stores specialize in top \nquality bluetooth technology ",
  ),
  StoresProductLists(
    storeName: "Airpod Pro Max",
    rating: "7.0 (20)",
    image: "assets/images/samsung.png",
    price: "\$14.89",
    description:
        "Toptek stores specialize in top \nquality bluetooth technology ",
  ),
  StoresProductLists(
    storeName: "PAirpod Pro",
    rating: "7.0 (20)",
    image: "assets/images/sendovia_logo.png",
    price: "\$14.89",
    description:
        "Toptek stores specialize in top \nquality bluetooth technology ",
  ),
  StoresProductLists(
    storeName: "Airpod Pro 2017",
    price: "\$14.89",
    description:
        "Toptek stores specialize in top \nquality bluetooth technology ",
    image: "assets/images/sendovia_logo.png",
    rating: "7.0 (20)",
  ),
];
