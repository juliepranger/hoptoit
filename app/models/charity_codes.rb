class CharityCodes

  def deductability
    {
      1 => "Contributions are deductible.",
      2 => "Contributions are not deductible.",
      4 => "Contributions are deductible by treaty (foreign organizations)."
    }
  end

  def income
    {
      0 => "0",
      1 => "1   to   9,999",
      2 => "10,000   to   24,999",
      3 => "25,000   to   99,999",
      4 => "100,000   to   499,999",
      5 => "500,000   to   999,999",
      6 => "1,000,000   to   4,999,999",
      7 => "5,000,000   to   9,999,999",
      8 => "10,000,000   to   49,999,999",
      9 => "50,000,000   to   greater"
    }
  end

  def foundation
    {
      '00' => "All organizations except 501(c)(3)",
      '02' => "Private operating foundation exempt from paying excise taxes on investment income",
      '03' => "Private operating foundation (other)",
      '04' => "Private non-operating foundation",
      '09' => "Suspense",
      '10' => "Church 170(b)(1)(A)(i)",
      '11' => "School 170(b)(1)(A)(ii)",
      '12' => "Hospital or medical research organization 170(b)(1)(A)(iii)",
      '13' => "Organization which operates for benefit of college or university and is owned or operated by a governmental unit 170(b)(1)(A)(iv)",
      '14' => "Governmental unit 170(b)(1)(A)(v)",
      '15' => "Organization which receives a substantial part of its support from a governmental unit or the general public   170(b)(1)(A)(vi)",
      '16' => "Organization that normally receives no more than one-third of its support from gross investment income and unrelated business income and at the same time more than one-third of its support from contributions, fees, and gross receipts related to exempt purposes.  509(a)(2)",
      '17' => "Organizations operated solely for the benefit of and in conjunction with organizations described in 10 through 16 above.  509(a)(3)",
      '18' => "Organization organized and operated to test for public safety 509(a)(4)",
      '21' => "509(a)(3) Type I",
      '22' => "509(a)(3) Type II",
      '23' => "509(a)(3) Type III functionally integrated",
      '24' => "509(a)(3) Type III not functionally integrated"
    }
  end

  def ntee_common
    {
     "A" => "Arts, Culture and Humanities",
     "B" => "Educational Institutions and Related Activities",
     "C" => "Environmental Quality, Protection and Beautification ",
     "D" => "Animal-Related",
     "E" => "Health – General and Rehabilitative",
     "F" => "Mental Health, Crisis Intervention",
     "G" => "Diseases, Disorders, Medical Disciplines",
     "H" => "Medical Research",
     "I" => "Crime, Legal-Related",
     "J" => "Employment, Job-Related",
     "K" => "Food, Agriculture and Nutrition",
     "L" => "Housing, Shelter",
     "M" => "Public Safety, Disaster Preparedness and Relief",
     "N" => "Recreation, Sports, Leisure, Athletics",
     "O" => "Youth Development",
     "P" => "Human Services – Multipurpose and Other",
     "Q" => "International, Foreign Affairs and National Security",
     "R" => "Civil Rights, Social Action, Advocacy",
     "S" => "Community Improvement, Capacity Building",
     "T" => "Philanthropy, Voluntarism and Grantmaking Foundations",
     "U" => "Science and Technology Research Institutes, Services",
     "V" => "Social Science Research Institutes, Services",
     "W" => "Public, Society Benefit – Multipurpose and Other",
     "X" => "Religion-Related, Spiritual Development",
     "Y" => "Mutual/Membership Benefit Organizations, Other",
     "Z" => "Unknown"
    }
  end

end