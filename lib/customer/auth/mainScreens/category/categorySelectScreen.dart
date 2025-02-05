import 'package:flutter/material.dart';
import 'package:mshora/widgets/common_widget.dart';

class CategoryOptionsScreen extends StatefulWidget {
  @override
  _CategoryOptionsScreenState createState() => _CategoryOptionsScreenState();
}

class _CategoryOptionsScreenState extends State<CategoryOptionsScreen> {
  // List of options with titles and images
  final List<Map<String, String>> options = [
    {"title": "Apartment", "image": "assets/images/Imagedfdf.png"},
    {"title": "Chalets", "image": "assets/images/Image111.png"},
    {"title": "Farms", "image": "assets/images/Image1123.png"},
    {"title": "Camps", "image": "assets/images/Image.png"},
  ];

  // To track the selected option
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Category"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (int index = 0; index < options.length; index++)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2 -
                        25, // Responsive sizing
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: selectedIndex == index
                            ? Colors.orange
                            : Colors.transparent,
                        width: 2,
                      ),
                      color:
                          selectedIndex == index ? Colors.black : Colors.white,
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                options[index]["image"]!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 150,
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: text(
                                options[index]["title"]!,
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                        if (selectedIndex == index)
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Icon(
                              Icons.check_circle,
                              color: Colors.orange,
                              size: 24,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
