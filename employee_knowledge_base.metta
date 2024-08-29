;Employee-Role relationships
(Role Alice Manager)
(Role Bob Developer)
(Role Charlie Developer)
(Role David QA)
(Role Emma QA)
(Role Frank Developer)
(Role Grace Designer)
(Role Harry Developer)
(Role Ivy Designer)
(Role Jack QA)

;Employee-Project assignments

(ProjectAssignment Charlie Project1)
(ProjectAssignment Emma Project2)
(ProjectAssignment Frank Project1)
(ProjectAssignment Grace Project3)
(ProjectAssignment Harry Project1)
(ProjectAssignment Ivy Project3)
(ProjectAssignment Jack Project2)


;Employee-Skills
(Skill Bob Python)
(Skill Charlie Java)
(Skill David Testing)
(Skill Emma Testing)
(Skill Frank Python)
(Skill Grace Design)
(Skill Harry Java)
(Skill Ivy Design)
(Skill Jack Testing)

;Gender information
(Gender Alice F)
(Gender Bob M)
(Gender Charlie M)
(Gender David M)
(Gender Emma F)
(Gender Frank M)
(Gender Grace F)
(Gender Harry M)
(Gender Ivy F)
(Gender Jack M)

;Boss-Employee relationships
(Boss Alice Bob)
(Boss Alice Charlie)
(Boss David Emma)
(Boss David Jack)
(Boss Grace Ivy)
(Boss Frank Harry)



;Rule 1: Retrieves all employees who hold a specific role.
(= (get-employees-by-role $role) (match &self (Role $x $role) $x))
!(get-employees-by-role Developer)

;Rule 2: Retrieves the skills of all employees working on a specific project.

(= (get-skills-in-project $project) 
   (match &self 
       (, (ProjectAssignment $x $project)
          (Skill $x $skill))
        $skill
   )
)       


!(get-skills-in-project Project2)


;Rule 3: Retrieves female employess with specific project

(= (get-females-for-project $project) 
   (match &self 
       (, (ProjectAssignment $x $project)
          (Gender $x F))
        $x
   )
)       


!(get-females-for-project Project2)


;Rule 4: Retrieves employes with the same skill set 

(=
  (get-employees-with-same-skills $skill)
  (match &self
    (Skill $employee $skill)
      $employee
  )
)


!(get-employees-with-same-skills Python)

;Rule 5: Retrive all employes working on the same project

(= (get-employees-by-project $project)
   (match &self 
   (ProjectAssignment $x $project) 
   $x)
)

!(get-employees-by-project Project1)

;Rule 6: get skills of female Designers

(= (get-skills-of-female-developers)
   (match &self 
      (, (Role $x Designer)
       (Gender $x F)
       (Skill $x $skill))
       $skill
    )
)

!(get-skills-of-female-developers)

;Rule 7: Retrive the boss of specific employee

(= (get-boss-of-employee $employee $boss)
   (match &self
     (Boss $boss $employee)
     $boss))
     
!(get-boss-of-employee Jack $boss)
