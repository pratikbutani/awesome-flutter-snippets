# Autocomplete

Code:
```
Autocomplete<Country>(
   optionsBuilder: (TextEditingValue textEditingValue) {
     return countryOptions
         .where((Country county) => county.name.toLowerCase()
         .startsWith(textEditingValue.text.toLowerCase())
     )
         .toList();
   },
   displayStringForOption: (Country option) => option.name,
   fieldViewBuilder: (
       BuildContext context,
       TextEditingController fieldTextEditingController,
       FocusNode fieldFocusNode,
       VoidCallback onFieldSubmitted
       ) {
     return TextField(
       controller: fieldTextEditingController,
       focusNode: fieldFocusNode,
       style: const TextStyle(fontWeight: FontWeight.bold),
     );
   },
   onSelected: (Country selection) {
     print('Selected: ${selection.name}');
   },
   optionsViewBuilder: (
       BuildContext context,
       AutocompleteOnSelected<Country> onSelected,
       Iterable<Country> options
       ) {
     return Align(
       alignment: Alignment.topLeft,
       child: Material(
         child: Container(
           width: double.infinity,
           color: Colors.cyan,
           child: ListView.builder(
             padding: const EdgeInsets.all(10.0),
             itemCount: options.length,
             itemBuilder: (BuildContext context, int index) {
               final Country option = options.elementAt(index);

               return GestureDetector(
                 onTap: () {
                   onSelected(option);
                 },
                 child: ListTile(
                   title: Text(option.name, style: const TextStyle(color: Colors.white)),
                 ),
               );
             },
           ),
         ),
       ),
     );
   },
 ),
```

## Try out on [Dartpad](https://dartpad.dev/?id=09ac4aad5fe1b03958988470ee614530). 