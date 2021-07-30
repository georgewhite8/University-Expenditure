**HESA Primary Model
clear
import excel "C:\Users\Georg\OneDrive - The University of Nottingham\Third Year\Dissertation\Data\HESA.xlsx", sheet("Sheet1") firstrow

*HESA Main
reg AverageIncome staffstudent SSR Entry Total London Scotland Russell PostProp Medicine Economics Engineering [aweight=Count], robust

*HESA with quadratic form
gen ss2 = staffstudent * staffstudent
gen SSR2 = SSR*SSR
*Model 3
reg AverageIncome staffstudent ss2 SSR Entry London Scotland Russell PostProp Medicine Economics Engineering Total [aweight = Count], robust
*Model 4
reg AverageIncome staffstudent ss2 SSR SSR2 Entry London Scotland Russell PostProp Medicine Economics Engineering Total [aweight = Count], robust

*Expenditure Robustness
gen es2 = expstudent*expstudent
gen AcT2 = AcTstudent*AcTstudent
gen AcSC2 = AcSCstudent*AcSCstudent
reg AverageIncome expstudent es2 SSR SSR2 Entry Total London Scotland Russell PostProp Medicine Economics Engineering [aweight=Count], robust
reg AverageIncome AcTstudent AcT2 SSR SSR2  Entry Total London Scotland Russell PostProp Medicine Economics Engineering [aweight=Count], robust
reg AverageIncome AcSCstudent AcSC2 SSR SSR2 Entry Total London Scotland Russell PostProp Medicine Economics Engineering [aweight=Count], robust

*White Test (for heteroskedasticity)
reg AverageIncome staffstudent SSR Entry Total London Scotland Russell PostProp Medicine Economics Engineering
estat imtest, white

**LEO Model
clear
import excel "C:\Users\Georg\OneDrive - The University of Nottingham\Third Year\Dissertation\Data\LEO Subject Studies\LEO Combined.xlsx", sheet("Combined") firstrow
gen ss2 = staffstudent * staffstudent
*LEO Biology
**Including Staff Costs
reg medianAnnEarn staffstudent ss2 SSR Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==1, robust
**Excluding Staff Costs
reg medianAnnEarn SSR Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==1, robust
**REF4 Model
reg medianAnnEarn SSR REF4 Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==1, robust
**REF4&3 Model
reg medianAnnEarn SSR REF43 Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==1, robust
*LEO Computing
reg medianAnnEarn staffstudent ss2 SSR Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==2, robust
reg medianAnnEarn SSR Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==2, robust
reg medianAnnEarn SSR REF4 Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==2, robust
reg medianAnnEarn SSR REF43 Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==2, robust
*LEO Economics
reg medianAnnEarn staffstudent ss2 SSR Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==3, robust
reg medianAnnEarn SSR Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==3, robust
reg medianAnnEarn SSR REF4 Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==3, robust
reg medianAnnEarn SSR REF43 Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==3, robust
*LEO Engineering
reg medianAnnEarn staffstudent ss2 SSR Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==4, robust
reg medianAnnEarn SSR Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==4, robust
reg medianAnnEarn SSR REF4 Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==4, robust
reg medianAnnEarn SSR REF43 Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==4, robust
*LEO English
reg medianAnnEarn staffstudent ss2 SSR Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==5, robust
reg medianAnnEarn SSR Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==5, robust
reg medianAnnEarn SSR REF4 Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==5, robust
reg medianAnnEarn SSR REF43 Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==5, robust
*LEO Languages
reg medianAnnEarn staffstudent ss2 SSR Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==6, robust
reg medianAnnEarn SSR Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==6, robust
reg medianAnnEarn SSR REF4 Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==6, robust
reg medianAnnEarn SSR REF43 Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==6, robust
*LEO Law
reg medianAnnEarn staffstudent ss2 SSR Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==7, robust
reg medianAnnEarn SSR Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==7, robust
reg medianAnnEarn SSR REF4 Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==7, robust
reg medianAnnEarn SSR REF43 Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==7, robust
*LEO Nursing
reg medianAnnEarn staffstudent ss2 SSR Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==8, robust
reg medianAnnEarn SSR Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==8, robust
reg medianAnnEarn SSR REF4 Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==8, robust
reg medianAnnEarn SSR REF43 Entry London Scotland Russell PostProp Total [aweight=earningsInclude] if s==8, robust

*Fixed Effects Model
clear
import excel "C:\Users\Georg\OneDrive - The University of Nottingham\Third Year\Dissertation\Data\LEO Subject Studies\LEO Combined.xlsx", sheet("Combined") firstrow
xtset s
*Panel with REF4
xtreg medianAnnEarn SSR REF4 Entry Total London Scotland Russell PostProp, fe robust
*Panel with REF43
xtreg medianAnnEarn SSR REF43 Entry Total London Scotland Russell PostProp, fe robust

*HESA Correlations
clear
import excel "C:\Users\Georg\OneDrive - The University of Nottingham\Third Year\Dissertation\Data\HESA.xlsx", sheet("Sheet1") firstrow
corr staffstudent expstudent
corr staffstudent AcTstudent
corr staffstudent AcSCstudent
corr staffstudent SSR
*HESA Graphs
clear
import excel "C:\Users\Georg\OneDrive - The University of Nottingham\Third Year\Dissertation\Data\HESA.xlsx", sheet("Sheet1") firstrow
*AvgInc ss linear
twoway (scatter AverageIncome staffstudent, mcolor(black) msymbol(smcircle)) (lfit AverageIncome staffstudent [pweight = Count], lcolor(blue)), ytitle(Graduates' Average Income (£)) ylabel(, nogrid) xtitle(Staff Costs per Student (£)) title(Average Income by Staff Costs, color(black)) subtitle(Linear Fit) legend(off) graphregion(fcolor(white))
*AvgInc ss quadratic
twoway (scatter AverageIncome staffstudent, mcolor(black) msymbol(smcircle)) (qfit AverageIncome staffstudent [pweight = Count], lcolor(blue)), ytitle(Graduates' Average Income (£)) ylabel(, nogrid) xtitle(Staff Costs per Student (£)) title(Average Income by Staff Costs, color(black)) subtitle(Quadratic Fit) legend(off) graphregion(fcolor(white))
*AvgInc SSR linear
twoway (scatter AverageIncome SSR, mcolor(black) msymbol(smcircle)) (lfit AverageIncome SSR [pweight = Count], lcolor(blue)), ytitle(Graduates' Average Income (£)) ylabel(, nogrid) xtitle(Student-Staff Ratio) title(Average Income by Student-Staff Ratio, color(black)) legend(off) graphregion(fcolor(white))
*ss SSR linear
twoway (scatter staffstudent SSR, mcolor(black) msymbol(smcircle)) (lfit staffstudent SSR [pweight = Count], lcolor(blue)), ytitle(Staff Costs per Student (£)) ylabel(, nogrid) xtitle(Student-Staff Ratio) title(Staff Costs by Student-Staff Ratio, color(black)) legend(off) graphregion(fcolor(white))
