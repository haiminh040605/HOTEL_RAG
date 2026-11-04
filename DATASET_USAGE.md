# Dataset usage and safeguards

1. Preserve original source files under `data/raw/`; never edit them in place.
2. Record the official source URL, retrieval date, license, attribution, and
   exact source filename before processing.
3. For the Mendeley datasets, DataCite metadata reports CC BY 4.0; retain
   required attribution and verify the actual downloadable package and license
   notice before redistribution.
4. The VN-SarMSA license/access state and VLSP dataset license are not verified;
   do not download or use them until the official owner confirms access and
   permitted use.
5. Keep natural and synthetic records distinguishable. Synthetic examples are
   not a natural-language test set.
6. The pipeline does not infer aspect or sentiment labels. ABSA training must
   use source-provided labels and group-based splits.
7. Official verified hotel facts and user reviews are separate evidence types.
   A review cannot establish official price, policy, or room availability.
8. Never treat a stored room price as a live quote or as evidence that the room
   is available for requested dates.
9. Keep personally identifying or credential data out of vector collections.
   Use document IDs and only the metadata needed to cite a source.
10. Current local inventory is empty, so no dataset usage or model training has
    yet occurred.
