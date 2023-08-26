# Canada-2021-Census

## Income

```bash
awk -F, '$2 >= 155 && $2 <= 186 || $2 >= 260 && $2 <= 300' income_FSA.csv > selected_income_FSA.csv
```

```
155	Total - Total income groups in 2020 for the population aged 15 years and over in private households - 100% data (21)
156	  Without total income
157	  With total income
158	    Under $10,000 (including loss)
159	    $10,000 to $19,999
160	    $20,000 to $29,999
161	    $30,000 to $39,999
162	    $40,000 to $49,999
163	    $50,000 to $59,999
164	    $60,000 to $69,999
165	    $70,000 to $79,999
166	    $80,000 to $89,999
167	    $90,000 to $99,999
168	    $100,000 and over
169	      $100,000 to $149,999
170	      $150,000 and over
171	Total - After-tax income groups in 2020 for the population aged 15 years and over in private households - 100% data (22)
172	  Without after-tax income
173	  With after-tax income
174	    Under $10,000 (including loss)
175	    $10,000 to $19,999
176	    $20,000 to $29,999
177	    $30,000 to $39,999
178	    $40,000 to $49,999
179	    $50,000 to $59,999
180	    $60,000 to $69,999
181	    $70,000 to $79,999
182	    $80,000 to $89,999
183	    $90,000 to $99,999
184	    $100,000 and over
185	      $100,000 to $124,999
186	      $125,000 and over
```

```
260	Total - Household total income groups in 2020 for private households - 100% data (21)
261	  Under $5,000
262	  $5,000 to $9,999
263	  $10,000 to $14,999
264	  $15,000 to $19,999
265	  $20,000 to $24,999
266	  $25,000 to $29,999
267	  $30,000 to $34,999
268	  $35,000 to $39,999
269	  $40,000 to $44,999
270	  $45,000 to $49,999
271	  $50,000 to $59,999
272	  $60,000 to $69,999
273	  $70,000 to $79,999
274	  $80,000 to $89,999
275	  $90,000 to $99,999
276	  $100,000 and over
277	    $100,000 to $124,999
278	    $125,000 to $149,999
279	    $150,000 to $199,999
280	    $200,000 and over
281	Total - Household after-tax income groups in 2020 for private households - 100% data (22)
282	  Under $5,000
283	  $5,000 to $9,999
284	  $10,000 to $14,999
285	  $15,000 to $19,999
286	  $20,000 to $24,999
287	  $25,000 to $29,999
288	  $30,000 to $34,999
289	  $35,000 to $39,999
290	  $40,000 to $44,999
291	  $45,000 to $49,999
292	  $50,000 to $59,999
293	  $60,000 to $69,999
294	  $70,000 to $79,999
295	  $80,000 to $89,999
296	  $90,000 to $99,999
297	  $100,000 and over
298	    $100,000 to $124,999
299	    $125,000 to $149,999
300	    $150,000 and over
```