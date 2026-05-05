# These are test files 
These files are intended to show how to validate TBX files from different dialects. At each level, there is a file that is valid and a file that should be rejected by that dialect's schema. The demonstrated dialects are TBX-Min and TBX-Basic, which are detailed [on the TBX website](https://www.tbxinfo.net/tbx-modules/). There are also files specifically for validation against the TBX core structure, as well as one for general XML well-formedness.

To validate any TBX file, you will need to have either core_schema.rng or core_schema.xsd downloaded. This ReadMe uses core_schema.rng, but either should work fine. Both of these files, as well as min_schema.sch and basic_schema.sch, will soon be posted in a location that will be referenced here.

# How to validate with oXygen
First, **open the TBX file** to validate in oXygen.

Then, **associate the TBX file** with applicable schemas against which it will be validated. For all dialects you will need to validate against the **TBX core structure**. Insert the following line of  XML at the top of your TBX file, above the opening tag of the `<tbx>` element; replace `PATH` with the relative filepath from the TBX file to wherever you have placed the `core_schema.rng` file:

`<?xml-model href="PATH/core_schema.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>`

For TBX-Min, TBX-Basic, or any other dialect, there are **Schematron rules** to associate in addition to the TBX core structure. Add the following XML just after the line for the core structure, again replacing `PATH` with the relative filepath from the TBX file to the Schematron file (for TBX-Min and TBX-Basic, this would be min_schema.sch and basic_schema.sch, respectively):

`<?xml-model href="PATH" type="application/xml" schematypens="http://purl.oclc.org/dsdl/schematron"?>`

Finally, **validate the TBX file** by clicking the icon on the top toolbar which shows a page with a big red checkmark on it. Any errors will be displayed at the bottom of the screen. Success will yield a green square and a success message.

# How to validate without oXygen
If you don't have the full paid version of oXygen, you can use a free tool like Liquid Studio. This can be found [online](https://www.liquid-technologies.com/online-relaxng-validator) or the community edition can be [downloaded for free](https://www.liquid-technologies.com/trial-download).

## Using Liquid Studio online
### Validating against the TBX-Core
On the webpage linked above:
1. select either `XML Validator (RelaxNG)` or `XML Validator (XSD)` on the left side, depending on whether you are using core_schema.rng or core_schema.xsd.
2. Copy and paste the whole contents of your TBX file into the box labelled `XML data to validate`.
3. Copy and paste the whole RNG or XSD file containing the TBX core structure in the box labelled `RelaxNG data` or `XML schema (XSD) data`.
4. Fill out the captcha and press `validate`.

### Validating against a dialect
To validate against a dialect, such as TBX-Min or TBX-Basic, first follow the steps above to validate against the TBX core structure. Then:
1. Select `XML Validator (Schematron)` on the left side of the webpage.
2. Copy and paste the whole contents of your TBX file into the box labelled `XML data to validate`.
3. Copy and paste the whole Schematron file containing your dialect's rules in the box labelled `Schematron data`.
4. Fill out the captcha and press `validate`.

## Using Liquid Studio Community Edition
To download and use a free tool from your desktop:
1. Follow the instructions [here](https://www.liquid-technologies.com/trial-download).
2. Open your TBX file in Liquid Studio
3. Associate the file with the core structure schema by inserting the following line of XML at the top of your TBX file, above the opening tag of the `<tbx>` element; replace `PATH` with the relative filepath from the TBX file to wherever you have placed the `core_schema.rng` file:

`<?xml-model href="PATH/core_schema.rng" type="application/xml" schematypens="http://relaxng.org/ns/structure/1.0"?>`

4. If the file uses a dialect, associate it with that dialect's Schematron: click `Schema Used to Validate XML1` or use `Ctrl + F7` to open the Schema Mapping Menu. Under `XML Schema Files`, click `Additional Schemas` and then `Add Schema File`. Find and select your dialect's Schematron file, then close the window with `OK`
5. Click `Validate Document` or use `F7` to validate. A dialog box will show results. 
