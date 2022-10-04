    class StarClipper extends CustomClipper<Path> {
      StarClipper(this.numberOfPoints);

      /// The number of points of the star
      final int numberOfPoints;

      @override
      Path getClip(Size size) {
        double width = size.width;
        print(width);
        double halfWidth = width / 2;

        double bigRadius = halfWidth;

        double radius = halfWidth / 1.3;

        num degreesPerStep = _degToRad(360 / numberOfPoints);

        double halfDegreesPerStep = degreesPerStep / 2;

        var path = Path();

        double max = 2 * math.pi;

        path.moveTo(width, halfWidth);

        for (double step = 0; step < max; step += degreesPerStep) {
          path.lineTo(halfWidth + bigRadius * math.cos(step),
              halfWidth + bigRadius * math.sin(step));
          path.lineTo(halfWidth + radius * math.cos(step + halfDegreesPerStep),
              halfWidth + radius * math.sin(step + halfDegreesPerStep));
        }

        path.close();
        return path;
      }

      num _degToRad(num deg) => deg * (math.pi / 180.0);

      @override
      bool shouldReclip(CustomClipper<Path> oldClipper) {
        StarClipper oldie = oldClipper as StarClipper;
        return numberOfPoints != oldie.numberOfPoints;
      }
    }
  
// Use it in your code

    Container(
      width: 200.0,
      height: 200.0,
      margin: const EdgeInsets.all(50.0),
      child: ClipPath(
                clipper: StarClipper(14),
                child: Container(
                  height: 200,
                  width: 200,
                  child: Image.network(
                'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
                fit: BoxFit.cover,
              ),
                ),
              ),
    );
    
Here is the [Dartpad](https://dartpad.dev/?id=86140bfe85c3e5c952bea5e6219d47d1)
